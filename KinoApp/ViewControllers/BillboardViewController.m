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
#import "UIColor+Custom.h"
#import "UIFont+Custom.h"

@interface BillboardViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *billboardCollectionView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *markerViewLeftSpace;
@property (weak, nonatomic) IBOutlet UIView *markerView;
@property (weak, nonatomic) IBOutlet UILabel *playingNowLabel;
@property (weak, nonatomic) IBOutlet UILabel *upcomingLabel;

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
    
    [self configPlayingNowLabel];
    [self configUpcomingLabel];
    
    [self configStyles];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
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

#pragma mark - Config methods.

- (void)configStyles
{
    [self.view setBackgroundColor:[UIColor appBGColor]];
    [self.markerView setBackgroundColor:[UIColor selectedItemColor]];
    self.topView.alpha = 0.9f;
    self.upcomingLabel.alpha = 1.0f;
    self.playingNowLabel.alpha = 1.0f;
}

- (void)configBillboardCollectionView
{
    self.billboardCollectionView.contentSize = CGSizeMake(self.billboardCollectionView.frame.size.width * 2, self.billboardCollectionView.frame.size.height);
    self.billboardCollectionView.pagingEnabled = YES;
    self.billboardCollectionView.showsHorizontalScrollIndicator = NO;
    self.billboardCollectionView.delegate = self.delegate;
    self.billboardCollectionView.dataSource = self.delegate;
    
    [self.billboardCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionFilmsCollectionViewCell class]) bundle:nil]
                   forCellWithReuseIdentifier:NSStringFromClass([CollectionFilmsCollectionViewCell class])];
}

- (void)configDelegate
{
    [self.delegate setMarkerViewLeftSpace:self.markerViewLeftSpace];
    self.delegate.billboardCollectionView = self.billboardCollectionView;
    [self.delegate setPlayingNowLabel:self.playingNowLabel];
    [self.delegate setUpcomingLabel:self.upcomingLabel];
}

- (void)configUpcomingLabel
{
    [self.upcomingLabel setUserInteractionEnabled:YES];
    self.upcomingLabel.text = NSLocalizedString(@"upcoming", nil);
    self.upcomingLabel.textColor = [UIColor unselectedItemColor];
    self.upcomingLabel.font = [UIFont appFontWithSize:20];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(upcomfingLabelPressed:)];
    [self.upcomingLabel addGestureRecognizer:tapGesture];
}

- (void)configPlayingNowLabel
{
    self.playingNowLabel.userInteractionEnabled = YES;
    self.playingNowLabel.text = NSLocalizedString(@"playing_now", nil);
    self.playingNowLabel.font = [UIFont appFontWithSize:20];
    self.playingNowLabel.textColor = [UIColor selectedItemColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playingNowLabelPressed:)];
    [self.playingNowLabel addGestureRecognizer:tapGesture];
}

#pragma mark - Action methods.
- (void)upcomfingLabelPressed:(UITapGestureRecognizer *)sender
{
    [self.delegate upcomingLabelPressed:self.upcomingLabel];
}

- (void)playingNowLabelPressed:(UITapGestureRecognizer *)sender
{
    [self.delegate playingNowLabelPressed:self.playingNowLabel];
}

#pragma mark - BillboardFilmCollectionEventReceiver.
- (void)billboardFilmCollectionViewCellSelectedWithFilmDTO:(id)filmDTO
{
    [self.router selectedCellWithFilmDTO:filmDTO fromViewController:self];
}

@end

