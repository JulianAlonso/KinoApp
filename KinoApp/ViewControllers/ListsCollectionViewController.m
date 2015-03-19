//
//  ListsCollectionViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 18/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ListsCollectionViewController.h"
#import "ListCollectionViewCell.h"
#import "ListCollectionViewCellController.h"
#import "FetchAllListsInteractor.h"

@interface ListsCollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *listsCollectionView;

@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, strong) NSArray *controllers;

@end

@interface ListsCollectionViewController (DataSource) <UICollectionViewDataSource>

@end

@interface ListsCollectionViewController (Delegate) <UICollectionViewDelegate>

@end

@interface ListsCollectionViewController (FlowLayoutDelegate) <UICollectionViewDelegateFlowLayout>

@end


@implementation ListsCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configListsCollectionView];
    [self loadLists];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Config methods.
- (void)configListsCollectionView
{
    self.listsCollectionView.pagingEnabled = YES;
    [self.listsCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ListCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([ListCollectionViewCell class])];
    self.listsCollectionView.delegate = self;
    self.listsCollectionView.dataSource = self;
}

#pragma mark - Load methods.
- (void)loadLists
{
    __weak typeof(self) weakSelf = self;
    [self.fetchAllListsInteractor fetchAllListsWithCompletion:^(NSArray *lists) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        strongSelf.lists = lists;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [strongSelf.listsCollectionView reloadData];
        });
    }];
}

@end

@implementation ListsCollectionViewController (DataSource)

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ListCollectionViewCell class]) forIndexPath:indexPath];
    
    ListCollectionViewCellController *controller = self.controllers[indexPath.item];
    
    controller.cell = cell;
    
    return [controller cellConfigured];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.lists.count;
}

@end

@implementation ListsCollectionViewController (Delegate)

@end

@implementation ListsCollectionViewController (FlowLayoutDelegate)

@end