//
//  ACBaseCollectionViewCell.h
//  ACBasePro
//
//  Created by achaoacwang on 2022/7/12.
//  Copyright © 2022 achaoacwang All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACBaseCollectionViewCell : UICollectionViewCell

// 通用 delegate
@property (nonatomic, weak) id normalDelegate;

- (void)_initView;

+ (CGFloat)cellHeight;
+ (NSString*)cellIdentifier;

@end

NS_ASSUME_NONNULL_END
