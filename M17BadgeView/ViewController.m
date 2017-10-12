//
//  ViewController.m
//  M17BadgeView
//
//  Created by chengbin on 11/10/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "ViewController.h"
#import "KACollectionViewCell.h"
#import "KACollectionViewFowLayout.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController
{
    
    NSUInteger numberOfColumn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.collectionView.collectionViewLayout = [[KACollectionViewFowLayout alloc]init];
    numberOfColumn = 3;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(0, 36);
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section {
    
    return CGSizeMake(0, 36);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {

    return 1 / [UIScreen mainScreen].scale;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 1 / [UIScreen mainScreen].scale;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat roundScale  = 1 / [UIScreen mainScreen].scale;
    CGFloat actualWidth = CGRectGetWidth([UIScreen mainScreen].bounds) - (numberOfColumn - 1) * roundScale - 10 * 2;
    CGFloat itemWidth = actualWidth / numberOfColumn;
    CGFloat width = roundf(itemWidth / roundScale) * roundScale;
    // 修正 width
     CGFloat correctValue = width * numberOfColumn + (numberOfColumn - 1) * roundScale - (CGRectGetWidth([UIScreen mainScreen].bounds) - 10 * 2);
    if (indexPath.row != 0 &&indexPath.row % (numberOfColumn - 1) == 0 && correctValue != 0) {
        width -= correctValue;
    }
    return CGSizeMake(width, 74.0f);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *resuableView = nil;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:@"headerID"
                                                                 forIndexPath:indexPath];
        resuableView.backgroundColor = [UIColor blueColor];
    }else {
        resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:@"footerID"
                                                                 forIndexPath:indexPath];
        resuableView.backgroundColor = [UIColor greenColor];
    }
    
    return resuableView;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 24;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.row % 5 == 0) {
      cell.badgeView.text = @"1折秒";
    }else if (indexPath.row % 4 == 0) {
      cell.badgeView.text = @"错峰季";
    }else if (indexPath.row % 3 == 0) {
      cell.badgeView.text = @"有礼";
    }else if (indexPath.row % 2 == 0) {
        cell.badgeView.text = @"拼多多";
    }else if (indexPath.row  == 23) {
        cell.badgeView.text = @"99+";
    }else {
      cell.badgeView.text = @(indexPath.row).stringValue;
    }
    
    return cell;
}

@end
