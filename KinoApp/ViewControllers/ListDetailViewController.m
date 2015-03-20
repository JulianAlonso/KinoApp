//
//  ListDetailViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ListDetailViewController.h"
#import "FilmTableViewCell.h"
#import "FilmTableViewCellController.h"
#import "ListDTO.h"
#import "ControllersFactory.h"
#import "DetailListRouter.h"

NSString *const kListProperty = @"list";

@interface ListDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *filmsTableView;

@property (nonatomic, strong) NSArray *controllers;

@end

@implementation ListDetailViewController

#pragma mark - Lifecycle methods.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerToObserveList];
    [self configTableView];
    [self configNavBarItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Config methods.
- (void)configTableView
{
    self.filmsTableView.delegate = self;
    self.filmsTableView.dataSource = self;
    
    [self.filmsTableView registerNib:[UINib nibWithNibName:NSStringFromClass([FilmTableViewCell class]) bundle:nil]
              forCellReuseIdentifier:NSStringFromClass([FilmTableViewCell class])];
}

- (void)configNavBarItems
{
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                  target:self
                                                                                  action:@selector(searchButtonPressed)];
    self.navigationItem.rightBarButtonItem = searchButton;
}

#pragma mark - Update methods.
- (void)updateControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    for (__unused FilmDTO *film in self.list.listFilms)
    {
        [controllers addObject:[ControllersFactory controllerForCellClass:[FilmTableViewCell class]]];
    }
    self.controllers = controllers;
}

#pragma mark - Obervation methods.
- (void)registerToObserveList
{
    [self addObserver:self forKeyPath:kListProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisterToObserveList
{
    [self removeObserver:self forKeyPath:kListProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kListProperty])
    {
        [self listChanged];
    }
}

#pragma mark - Action methods.
- (void)listChanged
{
    [self updateControllers];
}

- (void)searchButtonPressed
{
    [self.router searchButtonPressed];
}

#pragma mark - Datasource methods.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FilmTableViewCell class])];
    
    FilmTableViewCellController *controller = self.controllers[indexPath.row];
    controller.cell = cell;
    controller.film = self.list.listFilms[indexPath.row];
    
    return [controller configuredCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.listFilms.count;
}

#pragma mark - Delegate methods.
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

#pragma mark - Dealloc methods.
- (void)dealloc
{
    NSLog(@"dealoc at %@", self);
    [self unregisterToObserveList];
}

@end
