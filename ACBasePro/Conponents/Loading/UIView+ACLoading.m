//
//  UIView+ACLoading.m
//  ACBasePro
//
//  Created by 汪超 on 2022/3/1.
//  Copyright © 2022 achaoacwang All rights reserved.
//

#import "UIView+ACLoading.h"
#import "ACLoadingView.h"
#import <objc/runtime.h>

static const void *ACLoadingViewKey          = &ACLoadingViewKey;

@implementation UIView (ACLoading)

- (UIView *)showIWFullPageBackView:(ACLoadingViewBlock)backBlock {
    UIView* targetView = objc_getAssociatedObject(self, ACLoadingViewKey);
    if (targetView) {
        ACLoadingView *loadingView = (ACLoadingView *)targetView;
        loadingView.backBlock = backBlock;
        [loadingView updateToLoadingView];
        return loadingView;
    }
    ACLoadingView *loadingView = [ACLoadingView createACLoadingViewWith:self type:ACLoadingType_FullPageBack frame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    loadingView.backBlock = backBlock;
    [loadingView updateToLoadingView];
    objc_setAssociatedObject(self, ACLoadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return loadingView;
}

- (UIView *)showACLoadingView:(CGRect)frame{
    UIView* targetView = objc_getAssociatedObject(self, ACLoadingViewKey);
    if (targetView) {
        ACLoadingView *loadingView = (ACLoadingView *)targetView;
        [loadingView updateToLoadingView];
        return loadingView;
    }
    ACLoadingView *loadingView = [ACLoadingView createACLoadingViewWith:self type:ACLoadingType_CenterLoading frame:frame];
    [loadingView updateToLoadingView];
    objc_setAssociatedObject(self, ACLoadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return loadingView;
}

- (void)stopACLoadingView {
    UIView* targetView = objc_getAssociatedObject(self, ACLoadingViewKey);
    if(targetView){
        if(targetView.superview){
            [targetView removeFromSuperview];
        }
        objc_setAssociatedObject(self, ACLoadingViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)changeToErrorView:(ACLoadingViewBlock)retryBlock{
    UIView* targetView = objc_getAssociatedObject(self, ACLoadingViewKey);
    if(targetView){
        if ([targetView isKindOfClass:[ACLoadingView class]]) {
            ACLoadingView *loadingView = (ACLoadingView *)targetView;
            loadingView.retryBlock = retryBlock;
            [loadingView updateToErrorView];
        }else{
            [self stopACLoadingView];
        }
    }
}

- (BOOL)isACLoadingViewShown {
    UIView * view = [self ACLoadingView];
    if (view && !view.hidden) {
        return YES;
    }
    return NO;
}

- (UIView*)ACLoadingView {
    return objc_getAssociatedObject(self, ACLoadingViewKey);
}

@end
