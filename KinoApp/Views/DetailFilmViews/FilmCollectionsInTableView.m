//
//  FilmCollectionsInTableView.m
//  KinoApp
//
//  Created by Julian Alonso on 27/4/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "FilmCollectionsInTableView.h"
#import "FilmDetailListTableViewCell.h"
#import "FilmDetailListTableViewCellController.h"
#import "FetchAllListsInteractor.h"
#import "UIFont+Custom.h"
#import "InteractorsFactory.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

NSString *const kListFilmDetailtableViewCellListsProperty = @"lists";
NSString *const kListFilmDetailTableViewCell = @"cell";

@interface FilmCollectionsInTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, strong) NSArray *controllers;

@property (nonatomic, assign) CGFloat headerHeight;

@end

@implementation FilmCollectionsInTableView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self configTableView];
        [self configStyles];
    }
    
    return self;
}

#pragma mark - Config methods.
- (void)configTableView
{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass([FilmDetailListTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([FilmDetailListTableViewCell class])];
    
    [self registerObservers];
    [self updateLists];
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.scrollEnabled = NO;
    self.estimatedRowHeight = 75.0f;
    self.rowHeight = UITableViewAutomaticDimension;
}

- (void)configStyles
{
    self.backgroundColor = [UIColor clearColor];
    self.headerHeight = 30.0f;
}

#pragma mark - Update methods.
- (void)updateLists
{
    __weak typeof(self) weakSelf = self;
    [self.fetchListsInteractor fetchAllListsWithCompletion:^(NSArray *lists) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        strongSelf.lists = lists;
    }];
}

- (void)updateControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    for (__unused ListDTO *list in self.lists)
    {
        [controllers addObject:[FilmDetailListTableViewCellController new]];
    }
    self.controllers = controllers;
}

#pragma mark - Observe methods.
- (void)registerObservers
{
    [self addObserver:self forKeyPath:kListFilmDetailtableViewCellListsProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisterObservers
{
    [self removeObserver:self forKeyPath:kListFilmDetailtableViewCellListsProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kListFilmDetailtableViewCellListsProperty])
    {
        [self updateControllers];
        [self reloadData];
    }
}

#pragma mark - UITableViewDatasource methods.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilmDetailListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FilmDetailListTableViewCell class])];
    
    FilmDetailListTableViewCellController *controller = self.controllers[indexPath.row];
    
    controller.cell = cell;
    controller.film = self.film;
    controller.list = self.lists[indexPath.row];
    
    return [controller configuredCell];
}

#pragma mark - UITableViewDelegate methods.
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), self.headerHeight)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.frame), self.headerHeight - 5)];
    
    label.text = @"Collections it's in";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont appFontWithSize:26.0f];
    label.shadowColor = RGBA(0, 0, 0, 0.5f);
    label.shadowOffset = CGSizeMake(1.0f, 1.0f);
    
    CALayer *bottomBorder = [CALayer layer];
    CGFloat borderThickness = 2.0f;
    
    bottomBorder.frame = CGRectMake(0, self.headerHeight - borderThickness , CGRectGetWidth(self.frame), borderThickness);
    bottomBorder.backgroundColor = [[UIColor whiteColor] CGColor];
    
    [header addSubview:label];
    [header.layer addSublayer:bottomBorder];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.headerHeight + 1.0f;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - Lazy getters.
- (FetchAllListsInteractor *)fetchListsInteractor
{
    if (!_fetchListsInteractor)
    {
        _fetchListsInteractor = [InteractorsFactory fetchAllListsInteractor];
    }
    return _fetchListsInteractor;
}

#pragma mark - Dealloc.
- (void)dealloc
{
    [self unregisterObservers];
}

@end
