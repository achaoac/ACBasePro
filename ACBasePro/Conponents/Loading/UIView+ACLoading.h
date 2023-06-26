//
//  UIView+ACLoading.h
//  ACBasePro
//
//  Created by 汪超 on 2022/3/1.
//  Copyright © 2022 achaoacwang All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ACLoadingType_FullPageBack = 0,  //全屏loading自带返回按钮
    ACLoadingType_CenterLoading,  //指定frame，loading居中展示
} ACLoadingType;

typedef void (^ACLoadingViewBlock)(void);

@interface UIView (ACLoading)

//------------创建------------//
//展示带返回的全屏加载view
- (UIView *)showIWFullPageBackView:(ACLoadingViewBlock)backBlock;
//可控制frame的加载view,frame是加载视图的frame，loading居中展示
- (UIView *)showACLoadingView:(CGRect)frame;

//由加载view转换为错误view（如果加载view不存在，则错误页不会出现）
- (void)changeToErrorView:(ACLoadingViewBlock)retryBlock;

//------------停止和判断------------//
//停止加载view
- (void)stopACLoadingView;
//加载view是否在显示
- (BOOL)isACLoadingViewShown;

@end

NS_ASSUME_NONNULL_END
