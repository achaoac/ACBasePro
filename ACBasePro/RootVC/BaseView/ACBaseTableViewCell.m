//
//  ACBaseTableViewCell.m
//  ACBasePro
//
//  Created by achaoacwang on 2023/6/27.
//  Copyright © 2023 achao. All rights reserved.
//

#import "ACBaseTableViewCell.h"

@implementation ACBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self _initView];
    }
    return self;
}

- (void)_initView {
    
}

+ (CGFloat)cellHeight {
    return 44;
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

@end
