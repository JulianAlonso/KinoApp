//
//  ListFilmDetailTableViewCell.m
//  KinoApp
//
//  Created by Julian Alonso on 24/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "ListFilmDetailTableViewCell.h"
#import "FilmDetailListTableViewCell.h"
#import "FilmDetailListTableViewCellController.h"
#import "ListDTO.h"
#import "FetchAllListsInteractor.h"
#import "InteractorsFactory.h"
#import "UIColor+Custom.h"
#import "UIFont+Custom.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

NSString *const kListFilmDetailtableViewCellListsProperty = @"lists";
NSString *const kListFilmDetailtableViewCellTableContentSizeProperty = @"listsTableView.contentSize";

@interface ListFilmDetailTableViewCell () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;
@property (weak, nonatomic) IBOutlet UITableView *listsTableView;

@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, strong) NSArray *lists;

@property (nonatomic, assign) CGFloat headerHeight;

@end

@implementation ListFilmDetailTableViewCell

@synthesize controller = _controller;

- (void)awakeFromNib
{
    [self configStyles];

    [self configTableView];
    [self registers];
    [self updateLists];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - config methods.
- (void)configStyles
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    self.headerHeight = 30.0f;
}

- (void)configTableView
{
    self.listsTableView.delegate = self;
    self.listsTableView.dataSource = self;
    self.listsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.listsTableView registerNib:[UINib nibWithNibName:NSStringFromClass([FilmDetailListTableViewCell class]) bundle:nil]
              forCellReuseIdentifier:NSStringFromClass([FilmDetailListTableViewCell class])];
}

#pragma mark - Observe methods.
- (void)registers
{
    [self addObserver:self forKeyPath:kListFilmDetailtableViewCellListsProperty options:NSKeyValueObservingOptionInitial context:nil];
    [self addObserver:self forKeyPath:kListFilmDetailtableViewCellTableContentSizeProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisters
{
    [self removeObserver:self forKeyPath:kListFilmDetailtableViewCellListsProperty];
    [self removeObserver:self forKeyPath:kListFilmDetailtableViewCellTableContentSizeProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kListFilmDetailtableViewCellListsProperty])
    {
        [self updateControllers];
    }
    else if ([keyPath isEqualToString:kListFilmDetailtableViewCellTableContentSizeProperty])
    {
        self.tableViewHeight.constant = self.listsTableView.contentSize.height;
    }
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

#pragma mark - TableViewDatasource methods.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilmDetailListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FilmDetailListTableViewCell class])];
    
    FilmDetailListTableViewCellController *controller = self.controllers[indexPath.row];
    
    controller.cell = cell;
    controller.film = self.film;
    controller.list = self.lists[indexPath.row];
    
    return [controller configuredCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lists.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.listsTableView.frame), self.headerHeight)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.listsTableView.frame), self.headerHeight - 5)];
    
    label.text = @"Collections it's in";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont appFontWithSize:26.0f];
    label.shadowColor = RGBA(0, 0, 0, 0.5f);
    label.shadowOffset = CGSizeMake(1.0f, 1.0f);
    
    CALayer *bottomBorder = [CALayer layer];
    CGFloat borderThickness = 2.0f;
    
    bottomBorder.frame = CGRectMake(0, self.headerHeight - borderThickness , CGRectGetWidth(self.listsTableView.frame), borderThickness);
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
    [self unregisters];
}
@end
