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

NSString *const kFilmsProperty = @"films";

@interface SearchFilmViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, SearchFilmTableViewCellControllerDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleConstraint;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;

@property (nonatomic, strong) NSArray *films;
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation SearchFilmViewController

#pragma mark - Lifecycle methods.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerToObserveFilms];
    [self loadPopularFilms];
    [self configSearchBar];
    [self configSearchTableView];
    [self configNavBar];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.topConstraint.constant = self.topLayoutGuide.length;
    self.middleConstraint.constant = 0.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Config methods.
- (void)configSearchBar
{
    self.searchBar.delegate = self;
}

- (void)configSearchTableView
{
    self.searchTableView.delegate = self;
    self.searchTableView.dataSource = self;
    
    [self.searchTableView registerNib:[UINib nibWithNibName:NSStringFromClass([FilmTableViewCell class]) bundle:nil]
               forCellReuseIdentifier:NSStringFromClass([FilmTableViewCell class])];
}

- (void)configNavBar
{
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    self.navigationItem.titleView = searchBar;
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
    return  self.films.count;
}

#pragma mark - TableView Delegate methods.
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0f;
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
    [self.view endEditing:YES];
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

#pragma mark - Dealloc.
- (void)dealloc
{
    [self unregisterToObserveFilms];
}
@end
