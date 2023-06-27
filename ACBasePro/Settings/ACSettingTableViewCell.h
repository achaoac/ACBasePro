//
//  ACSettingTableViewCell.h
//  ACBasePro
//
//  Created by achaoacwang on 2022/6/14.
//  Copyright © 2022 achaoacwang. All rights reserved.
//

#import "ACBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACSettingTableViewCell : ACBaseTableViewCell

- (void)updateUI:(NSString *)name subName:(NSString *)subName subNameMedium:(BOOL)isSubNameMedium arrow:(BOOL)hasArrow;

@end

NS_ASSUME_NONNULL_END
