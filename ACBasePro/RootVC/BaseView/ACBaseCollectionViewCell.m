//
//  ACBaseCollectionViewCell.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/7/12.
//  Copyright © 2022 achaoacwang All rights reserved.
//

#import "ACBaseCollectionViewCell.h"

@implementation ACBaseCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _initView];
    }
    return self;
}

- (void)_initView {
}

+ (CGFloat)cellHeight {
    return 100;
}

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}

@end
