//
//  KACollectionViewCell.m
//  PresentationControllerSample
//
//  Created by chengbin on 29/09/2017.
//  Copyright © 2017 bricklife.com. All rights reserved.
//

#import "KACollectionViewCell.h"

@implementation KACollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];

    self.badgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentRight;
    self.badgeView.verticalAlignment = M13BadgeViewVerticalAlignmentTop;
    self.badgeView.hidesWhenZero = YES;
    self.badgeView.font = [UIFont fontWithName:@"PingFang SC" size:10.0f];
    self.badgeView.animateChanges = NO;
    self.badgeView.textColor = [UIColor whiteColor];
    self.badgeView.textTopMargin = 0.0f;
    self.badgeView.alignmentShift = CGSizeMake(-5.0f, 5.0f);
    self.badgeView.bounds = CGRectMake(0, 0, 20, 16);
    [self.contentView bringSubviewToFront:self.badgeView];
}
- (void)prepareForReuse {
    [super prepareForReuse];
}

@end
