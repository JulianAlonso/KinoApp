//
//  BillboardViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "BillboardViewController.h"
#import "BillboardFilmCollectionViewCell.h"
#import "CollectionFilmsCollectionViewCell.h"
#import "FilmDTO.h"
#import "BillboardRouter.h"

@interface BillboardViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *billboardCollectionView;
@property (weak, nonatomic) IBOutlet UIView *refereceView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation BillboardViewController

#pragma mark - Lifecycle methods.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configBillboardCollectionView];
    [self configDelegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLayoutSubviews
{
    self.topConstraint.constant = self.topLayoutGuide.length + 10;
    self.bottomConstraint.constant = self.bottomLayoutGuide.length;
}

#pragma mark - Config methods.
- (void)configBillboardCollectionView
{
    self.billboardCollectionView.contentSize = CGSizeMake(self.refereceView.frame.size.width * 2, self.refereceView.frame.size.height);
    self.billboardCollectionView.pagingEnabled = YES;
    self.billboardCollectionView.showsHorizontalScrollIndicator = NO;
    self.billboardCollectionView.delegate = self.delegate;
    self.billboardCollectionView.dataSource = self.delegate;
    self.billboardCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self.billboardCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionFilmsCollectionViewCell class]) bundle:nil]
                   forCellWithReuseIdentifier:NSStringFromClass([CollectionFilmsCollectionViewCell class])];
}

- (void)configDelegate
{
    [self.delegate setSegmentedControl:self.segmentedControl];
    self.delegate.billboardCollectionView = self.billboardCollectionView;
    [self.segmentedControl addTarget:self.delegate action:@selector(valueChangedAtSelectedControl:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - BillboardFilmCollectionEventReceiver.
- (void)billboardFilmCollectionViewCellSelectedWithFilmDTO:(id)filmDTO
{
    [self.router selectedCellWithFilmDTO:filmDTO fromViewController:self];
}

@end

