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
#import "UIColor+Custom.h"
#import "ListDTO.h"
#import "FilmDTO.h"
#import "ControllersAssembly.h"

NSString *const kListsProperty = @"lists";

@interface ListsCollectionViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UICollectionView *listsCollectionView;

@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, strong) NSArray *controllers;

@property (nonatomic, assign) CGFloat actualIndex;
@property (nonatomic, assign) CGFloat scrollStart;
@property (nonatomic, assign) CGFloat scrollEnd;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat headerWidth;

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
    [self configListsCollectionView];
    [self configStyles];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self loadLists];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
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
    self.listsCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
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
        FilmListCollectionViewCellController *controller = [self.controllersAssembly filmListCollectionViewCellContorller];
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
        
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        [manager downloadImageWithURL:[NSURL URLWithString:film.filmBackdropPath] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            //Setting image
            self.backgroundImage.image = image;
            //Animating
            CATransition *transition = [CATransition animation];
            transition.duration = 0.5f;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionFade;
            [self.backgroundImage.layer addAnimation:transition forKey:nil];
        }];
    }
}

#pragma mark - Custom setters methods.
- (void)setLists:(NSArray *)lists
{
    _lists = lists;
    [self changedValueOfFilms];
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

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self configBackground];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.scrollStart = scrollView.contentOffset.x;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    self.scrollEnd = scrollView.contentOffset.x;
    CGFloat posVelocity = velocity.x;
    if (posVelocity < 0)
    {
        posVelocity = posVelocity * -1;
    }
    
    if (self.scrollEnd > self.scrollStart)
    {
        CGFloat desplaced = self.scrollEnd - self.scrollStart;
        if (desplaced > CGRectGetWidth(scrollView.frame) / 3 || posVelocity > 0.3)
        {
            (self.actualIndex < self.lists.count) ? self.actualIndex ++ : self.actualIndex;
        }
       targetContentOffset->x = self.actualIndex * (self.itemWidth + self.headerWidth - 1);
    }
    else
    {
        CGFloat desplaced = self.scrollStart - self.scrollEnd;
        if (desplaced > CGRectGetWidth(scrollView.frame) / 3 || posVelocity > 0.3)
        {
            (self.actualIndex > 0) ? self.actualIndex -- : self.actualIndex;
        }
        targetContentOffset->x = self.actualIndex * (self.itemWidth + self.headerWidth - 1);
    }
}

@end

@implementation ListsCollectionViewController (DelegateAndFlowLayoutDelegate)

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = CGRectGetWidth(self.listsCollectionView.bounds) - 100;
    CGFloat height = CGRectGetHeight(self.listsCollectionView.bounds) - 100;
    
    self.itemWidth = width - 40;
    
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 50;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    self.headerWidth = 50;
    return CGSizeMake(50, CGRectGetHeight(collectionView.frame));
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(50, CGRectGetHeight(collectionView.frame));
}

@end				