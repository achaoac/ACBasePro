//
//  ACBaseTableViewCell.h
//  ACBasePro
//
//  Created by achaoacwang on 2023/6/27.
//  Copyright © 2023 achao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACBaseTableViewCell : UITableViewCell

/// 通用 delegate
@property (nonatomic, weak) id normalDelegate;

/// 初始化
- (void)_initView;

/// 高度
+ (CGFloat)cellHeight;

/// 标识符
+ (NSString*)cellIdentifier;

@end

NS_ASSUME_NONNULL_END
