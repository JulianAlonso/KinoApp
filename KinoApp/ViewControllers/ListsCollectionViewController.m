//
//  ListsCollectionViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "ListsCollectionViewController.h"
#import "FilmListCollectionViewCell.h"
#import "FilmListCollectionViewCellController.h"
#import "FetchAllListsInteractor.h"
#import "ControllersFactory.h"
#import "UIColor+Custom.h"
#import "ListDTO.h"
#import "FilmDTO.h"

NSString *const kListsProperty = @"lists";

@interface ListsCollectionViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UICollectionView *listsCollectionView;

@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, strong) NSArray *controllers;

@property (nonatomic, assign) CGFloat actualIndex;

@end

@interface ListsCollectionViewController (DataSource) <UICollectionViewDataSource>

@end

@interface ListsCollectionViewController (DelegateAndFlowLayoutDelegate) <UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout>

@end


@implementation ListsCollectionViewController

#pragma mark - VC lifecycle methods.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.actualIndex = 0;
    
    [self registerToObserveFilms];
    [self configListsCollectionView];
    [self configStyles];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self loadLists];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLayoutSubviews
{
    self.topConstraint.constant = self.topLayoutGuide.length;
    self.bottomConstraint.constant = self.bottomLayoutGuide.length;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Config methods.
- (void)configListsCollectionView
{
    [self.listsCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([FilmListCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([FilmListCollectionViewCell class])];
    self.listsCollectionView.delegate = self;
    self.listsCollectionView.dataSource = self;
    self.listsCollectionView.showsHorizontalScrollIndicator = NO;
}

- (void)configStyles
{
    self.view.backgroundColor = [UIColor appBGColor];
}

#pragma mark - Load methods.
- (void)loadControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    
    for (__unused ListDTO *l in self.lists)
    {
        FilmListCollectionViewCellController *controller = [ControllersFactory controllerForCellClass:[FilmListCollectionViewCell class]];
        controller.router = self.router;
        [controllers addObject:controller];
    }
    
    self.controllers = controllers;
}

- (void)loadLists
{
    __weak typeof(self) weakSelf = self;
    [self.fetchAllListsInteractor fetchAllListsWithCompletion:^(NSArray *lists) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        strongSelf.lists = lists;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [strongSelf.listsCollectionView reloadData];
            [strongSelf configBackground];
        });
    }];
}

#pragma mark - Observation methods.
- (void)registerToObserveFilms
{
    [self addObserver:self forKeyPath:kListsProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisterToObserveFilms
{
    [self removeObserver:self forKeyPath:kListsProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kListsProperty])
    {
        [self changedValueOfFilms];
    }
}

#pragma mark - Action methods.
- (void)changedValueOfFilms
{
    [self loadControllers];
}

#pragma mark - Own methods.
- (void)configBackground
{
    if (self.actualIndex < self.lists.count)
    {
        ListDTO *list = self.lists[(int)self.actualIndex];
        FilmDTO *film = [list.listFilms firstObject];
        
        [self.backgroundImage sd_setImageWithURL:[NSURL URLWithString:film.filmPosterPath]];
    }
}

#pragma mark - Dealloc method.
-(void)dealloc
{
    [self unregisterToObserveFilms];
}

@end

@implementation ListsCollectionViewController (DataSource)

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FilmListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FilmListCollectionViewCell class]) forIndexPath:indexPath];
    
    FilmListCollectionViewCellController *controller = self.controllers[indexPath.item];
    
    controller.cell = cell;
    controller.list = self.lists[indexPath.item];
    
    return (UICollectionViewCell *)[controller cellConfigured];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.lists.count;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGFloat cellWidth = CGRectGetWidth(self.listsCollectionView.frame) - 88.5f;
    
    if (scrollView.contentOffset.x < targetContentOffset->x)
    {
        if (targetContentOffset->x != 0.0f)
        {
            self.actualIndex == self.lists.count + 5 ? self.actualIndex : self.actualIndex ++;
            targetContentOffset->x = cellWidth * self.actualIndex;//(int)(targetContentOffset->x / cellWidth);
        }
    }
    else
    {
        if (targetContentOffset->x < (cellWidth + 50) * (self.lists.count + 3))
        {
            self.actualIndex > 0 ? self.actualIndex -- : self.actualIndex;
            targetContentOffset->x = cellWidth * self.actualIndex;//(int)(targetContentOffset->x / cellWidth);
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self configBackground];
}

@end

@implementation ListsCollectionViewController (DelegateAndFlowLayoutDelegate)

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = CGRectGetWidth(self.listsCollectionView.bounds) - 100;
    CGFloat height = CGRectGetHeight(self.listsCollectionView.bounds) - 100;
    
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 50;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(50, CGRectGetHeight(collectionView.frame));
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(50, CGRectGetHeight(collectionView.frame));
}

@end