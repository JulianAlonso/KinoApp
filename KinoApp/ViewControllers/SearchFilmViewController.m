//
//  SearchViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "SearchFilmViewController.h"
#import "SearchFilmTableViewCellController.h"
#import "ControllersFactory.h"
#import "FilmTableViewCell.h"
#import "LoadPopularFilmsInteractor.h"
#import "SearchFilmInteractor.h"
#import "SearchFilmRouter.h"
#import "UIColor+Custom.h"
#import "UISearchBar+Custom.h"
#import "UIFont+Custom.h"
#import "ReachabilityHelper.h"

NSString *const kFilmsProperty = @"films";

@interface SearchFilmViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, SearchFilmTableViewCellControllerDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (nonatomic, strong) NSArray *films;
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation SearchFilmViewController

#pragma mark - Lifecycle methods.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configStyles];
    [self registerToObserveFilms];
    [self loadPopularFilms];
    [self configSearchBar];
    [self configNavBar];
    [self configSearchTableView];
    [self checkInternetConnection];
    self.title = @"";
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.topConstraint.constant = self.topLayoutGuide.length;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [super viewWillDisappear:animated];
}

#pragma mark - Config methods.
- (void)configStyles
{
    self.view.backgroundColor = [UIColor appBGColor];
    self.infoLabel.alpha = 0.0f;
    self.infoLabel.font = [UIFont appFontWithSize:30.0f];
    self.infoLabel.textColor = [UIColor unselectedItemColor];
}

- (void)configSearchTableView
{
    self.searchTableView.delegate = self;
    self.searchTableView.dataSource = self;
    self.searchTableView.backgroundColor = [UIColor clearColor];
    self.searchTableView.estimatedRowHeight = 140.0f;
    self.searchTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.searchTableView registerNib:[UINib nibWithNibName:NSStringFromClass([FilmTableViewCell class]) bundle:nil]
               forCellReuseIdentifier:NSStringFromClass([FilmTableViewCell class])];
}

- (void)configSearchBar
{
    self.searchBar =
    [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search";
    self.navigationItem.titleView = self.searchBar;
    [self.searchBar setBackgroundImage:[[UIImage alloc]init]];
    [self.searchBar setTextBackgroundColor:[UIColor appBGColor]];
    [self.searchBar setTextColor:[UIColor unselectedItemColor]];
    [self.searchBar setTextFont:[UIFont appFontWithSize:15]];
    [self.searchBar setPlaceholderColor:[UIColor unselectedItemColor]];
}

- (void)configNavBar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                           target:self
                                                                                           action:@selector(cancelButtonPressed)];
    self.navigationItem.hidesBackButton = YES;
}

#pragma mark - Check methods.
- (void)checkInternetConnection
{
    if (![ReachabilityHelper internetConnection])
    {
        self.infoLabel.alpha = 1.0f;
        self.searchTableView.alpha = 0.0f;
        self.infoLabel.text = @"No hay internet tio";
        self.searchBar.userInteractionEnabled = NO;
    }
}

#pragma mark - Load methods.
- (void)loadControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    for (__unused FilmDTO *f in self.films)
    {
        SearchFilmTableViewCellController *controller = [SearchFilmTableViewCellController new];
        controller.delegate = self;
        [controllers addObject:controller];
    }
    self.controllers = controllers;
}

- (void)loadPopularFilms
{
    __weak typeof(self) weakSelf = self;
    [self.popularInteractor loadPopularFilms:^(NSArray *films) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            strongSelf.films = films;
            
            [strongSelf.searchTableView reloadData];
        });
    }];
}

#pragma mark - TableView Datasource methods.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FilmTableViewCell class])];
    
    SearchFilmTableViewCellController *controller = self.controllers[indexPath.row];
    
    controller.cell = cell;
    controller.film = self.films[indexPath.row];
    
    return [controller configuredCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.films.count;
}

#pragma mark - TableView Delegate methods.
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140.0f;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark - SearchBar delegate methods.
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText isEqualToString:@""])
    {
        [self loadPopularFilms];
        return;
    }
    __weak typeof(self) weakSelf = self;
    [self.searchInteractor searchFilm:searchText completion:^(NSArray *films) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            strongSelf.films = films;
            
            [strongSelf.searchTableView reloadData];
        });
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.navigationController.view endEditing:YES];
}

#pragma mark - SearchFilmTableViewCellControllerDelegate methods.
- (void)searchFilmTableViewCellController:(SearchFilmTableViewCellController *)earchFilmTableViewCellController tappedCellWithFilm:(FilmDTO *)film
{
    [self.router tappedCellWithFilm:film];
}

#pragma mark - Observe methods.
- (void)registerToObserveFilms
{
    [self addObserver:self forKeyPath:kFilmsProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisterToObserveFilms
{
    [self removeObserver:self forKeyPath:kFilmsProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kFilmsProperty])
    {
        [self filmsValueChanged];
    }
}

#pragma mark - Action methods.
- (void)filmsValueChanged
{
    [self loadControllers];
}

- (void)cancelButtonPressed
{
    [self.navigationController.view endEditing:YES];
    [self.router popSearchFilmViewController];
}

#pragma mark - Dealloc.
- (void)dealloc
{
    [self unregisterToObserveFilms];
}
@end
