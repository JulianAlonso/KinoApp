//
//  ListDetailViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 20/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ListDetailViewController.h"
#import "FilmTableViewCell.h"
#import "FilmCollectionViewCellController.h"
#import "ListDTO.h"
#import "DetailListRouter.h"
#import "BillboardFilmCollectionViewCell.h"
#import "UIColor+Custom.h"
#import "UpdateListInteractor.h"
#import "SizeHelper.h"
#import "ControllersAssembly.h"

NSString *const kListProperty = @"list";

@interface ListDetailViewController () <UICollectionViewDataSource, UICollectionViewDelegate, FilmCollectionViewControllerCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *filmsCollectionView;

@property (nonatomic, strong) NSArray *controllers;

@end

@implementation ListDetailViewController

#pragma mark - Lifecycle methods.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerToObserveList];
    [self configCollectionView];
    [self configNavBarItems];
    [self configStyles];
    self.title = self.list.listName;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    [self updateListFilms];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


#pragma mark - Config methods.
- (void)configCollectionView
{
    self.filmsCollectionView.delegate = self;
    self.filmsCollectionView.dataSource = self;
    self.filmsCollectionView.alwaysBounceVertical = YES;
    
    [self.filmsCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BillboardFilmCollectionViewCell class]) bundle:nil]
               forCellWithReuseIdentifier:NSStringFromClass([BillboardFilmCollectionViewCell class])];
}

- (void)configNavBarItems
{
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                  target:self
                                                                                  action:@selector(searchButtonPressed)];
    self.navigationItem.rightBarButtonItem = searchButton;
}

- (void)configStyles
{
    self.view.backgroundColor = [UIColor appBGColor];
}

#pragma mark - Update methods.
- (void)updateControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    for (__unused FilmDTO *film in self.list.listFilms)
    {
        FilmCollectionViewCellController *controller = [self.controllersAssembly filmCollectionViewCellController];
        controller.delegate = self;
        [controllers addObject:controller];
    }
    self.controllers = controllers;
}

- (void)updateListFilms
{
    __weak typeof(self) weakSelf = self;
    [self.updateListInteractor updateList:self.list completion:^(ListDTO *list) {
        
        weakSelf.list = list;
        [weakSelf.filmsCollectionView reloadData];
    }];
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
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BillboardFilmCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BillboardFilmCollectionViewCell class]) forIndexPath:indexPath];
    
    FilmCollectionViewCellController *controller = self.controllers[indexPath.row];
    controller.cell = cell;
    controller.film = self.list.listFilms[indexPath.row];
    
    return [controller configuredCell];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.list.listFilms.count;
}

#pragma mark - CollectionView FloatLayout delegate methods.
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = CGRectGetWidth(collectionView.bounds) / 2;
    
    return [SizeHelper sizeForFilmCellWithWidth:width];
}

#pragma mark - FilmTableViewControllerCellDelegate methods.
- (void)filmCollectionViewCellController:(FilmCollectionViewCellController *)filmTableViewCellController tappedCellWithFilm:(FilmDTO *)film
{
    [self.router tappedCellWithFilm:film];
}

#pragma mark - Override methods.
- (BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

#pragma mark - Dealloc method.
- (void)dealloc
{
    [self unregisterToObserveList];
}

@end
