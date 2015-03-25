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

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

NSString *const kListFilmDetailtableViewCellListsProperty = @"lists";

@interface ListFilmDetailTableViewCell () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;
@property (weak, nonatomic) IBOutlet UITableView *listsTableView;

@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, strong) NSArray *lists;

@end

@implementation ListFilmDetailTableViewCell

@synthesize controller = _controller;

- (void)awakeFromNib
{
    [self configStyles];
    
    [self configTableView];
    [self registerToObserveLists];
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
    self.backgroundColor = RGBA(51, 51, 51, 0.7f);
}

- (void)configTableView
{
    self.listsTableView.delegate = self;
    self.listsTableView.dataSource = self;
    
    [self.listsTableView registerNib:[UINib nibWithNibName:NSStringFromClass([FilmDetailListTableViewCell class]) bundle:nil]
              forCellReuseIdentifier:NSStringFromClass([FilmDetailListTableViewCell class])];
}

#pragma mark - Observe methods.
- (void)registerToObserveLists
{
    [self addObserver:self forKeyPath:kListFilmDetailtableViewCellListsProperty options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unregisterToObserveLists
{
    [self removeObserver:self forKeyPath:kListFilmDetailtableViewCellListsProperty];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kListFilmDetailtableViewCellListsProperty])
    {
        [self updateControllers];
    }
}

#pragma mark - Update methods.
- (void)updateLists
{
    __weak typeof(self) weakSelf = self;
    [self.fetchListsInteractor fetchAllListsWithCompletion:^(NSArray *lists) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        strongSelf.lists = lists;
        strongSelf.tableViewHeight.constant = 50 * lists.count;
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
    controller.list = self.lists[indexPath.row];
    
    return [controller configuredCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lists.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Collections it's in";
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
    [self unregisterToObserveLists];
}
@end
