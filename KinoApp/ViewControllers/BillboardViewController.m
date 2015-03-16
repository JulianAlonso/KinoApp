//
//  BillboardViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 16/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "BillboardViewController.h"
#import "BillboardCollectionViewCell.h"

@interface BillboardViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *billboardCollectionView;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation BillboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configRefreshControl];
    [self configBillboardCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Config methods.
- (void)configBillboardCollection
{
    self.billboardCollectionView.dataSource = self.delegate;
    self.billboardCollectionView.delegate = self.delegate;
    
    [self.billboardCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BillboardCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([BillboardCollectionViewCell class])];
    [self.billboardCollectionView addSubview:self.refreshControl];
}

- (void)configRefreshControl
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self.delegate action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
}

@end

