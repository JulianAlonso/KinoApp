//
//  CustomCollectionViewFlowLayout.m
//  KinoApp
//
//  Created by Julian Alonso on 23/3/15.
//  Copyright (c) 2015 Julian. All rights reserved.
//

#import "CustomCollectionViewFlowLayout.h"

@implementation CustomCollectionViewFlowLayout

- (CGFloat)pageWidth {
    return self.itemSize.width + self.minimumLineSpacing;
}

- (CGFloat)flickVelocity {
    return 0.3;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat cellWidth = CGRectGetWidth(self.collectionView.frame) - 100;
//
//    NSLog(@"cellWidth: %f", cellWidth);
//    NSLog(@"proposedContentOffset: %@", NSStringFromCGPoint(proposedContentOffset));
//    
//    return CGPointMake(proposedContentOffset.x - 100, proposedContentOffset.y);
    
    self
    
    
    NSLog(@"currentPage: %.0f", currentPage);
    
    CGFloat destinyX = cellWidth * currentPage + 120;
    
    return CGPointMake(destinyX, proposedContentOffset.y);
}

@end
