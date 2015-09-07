//
//  SelectListViewController.m
//  KinoApp
//
//  Created by Julian Alonso on 19/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "SelectListViewController.h"
#import "ListTableViewCell.h"
#import "ListDTO.h"
#import "SelectListRouter.h"
#import "FetchAllListsInteractor.h"
#import "UIColor+Custom.h"

@interface SelectListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@property (weak, nonatomic) IBOutlet UITableView *selectListTableView;

@property (nonatomic, strong) NSArray *lists;

@end

@implementation SelectListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configTableView];
    [self updateLists];
    [self configStyles];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    [super viewWillAppear:animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    [super viewWillDisappear:animated];
//}

- (void)viewDidLayoutSubviews
{
    self.topConstraint.constant = self.topLayoutGuide.length;
}

#pragma mark - Config methods.
- (void)configTableView
{
    self.selectListTableView.delegate = self;
    self.selectListTableView.dataSource = self;
    
    [self.selectListTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ListTableViewCell class]) bundle:nil]
                   forCellReuseIdentifier:NSStringFromClass([ListTableViewCell class])];
}

- (void)configStyles
{
    self.view.backgroundColor = [UIColor appBGColor];
}

#pragma mark - Update methods.
- (void)updateLists
{
    __weak typeof(self) weakSelf = self;
    [self.interactor fetchAllListsWithCompletion:^(NSArray *lists) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            strongSelf.lists = lists;
            [strongSelf.selectListTableView reloadData];
        });
    }];
}

#pragma mark - Data source methods.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ListTableViewCell class])];
    
    cell.listNameLabel.text = [self.lists[indexPath.row] valueForKey:kListNameProperty];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lists.count;
}

@end
