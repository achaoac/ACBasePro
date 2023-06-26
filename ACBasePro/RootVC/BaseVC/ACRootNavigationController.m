//
//  MFRootNaviVC.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/2/14.
//

#import "ACRootNavigationController.h"

@interface ACRootNavigationController ()

@end

@implementation ACRootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 是否支持自动旋转
- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

// 支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

@end
