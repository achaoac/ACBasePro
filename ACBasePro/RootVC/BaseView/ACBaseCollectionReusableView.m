//
//  ACBaseCollectionReusableView.m
//  ACBasePro
//
//  Created by achaoacwang on 2023/6/16.
//  Copyright © 2023 achaoacwang All rights reserved.
//

#import "ACBaseCollectionReusableView.h"

@implementation ACBaseCollectionReusableView

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
