//
//  ACLoadingView.h
//  ACBasePro
//
//  Created by 汪超 on 2022/3/1.
//  Copyright © 2022 achaoacwang All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACLoadingView : UIView

@property (nonatomic,copy)ACLoadingViewBlock backBlock;
@property (nonatomic,copy)ACLoadingViewBlock retryBlock;

+ (ACLoadingView *)createACLoadingViewWith:(UIView *)spView type:(ACLoadingType)type frame:(CGRect)frame;
- (void)updateToLoadingView;
- (void)updateToErrorView;

@end

NS_ASSUME_NONNULL_END
