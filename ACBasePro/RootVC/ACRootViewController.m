//
//  ACRootViewController.m
//  ACBasePro
//
//  Created by achaoacwang on 2023/6/26.
//  Copyright © 2023 achao. All rights reserved.
//

#import "ACRootViewController.h"
#import "ACAppLaunchTaskManager.h"

@interface ACRootViewController ()

@end

@implementation ACRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNavigationbar:NO];
    [self createRightButtonWithImage:@"ac_icon_settings"];
    self.titleLab.text = ac_appName();
}

- (void)rightBtnAction:(UIButton *)sender {
    [ACRouter jump:[ACRouter routerUrl:@"settingsVC"]];
}

#pragma mark - private method
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[self class] executeAppLaunchAsyncTasks];
}

// 执行APP启动后异步启动任务
+ (void)executeAppLaunchAsyncTasks {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [ACAppLaunchTaskManager startLoadTasks:ACAppLaunchTaskPriorityType_MainThreadAsyncP1];
        [ACAppLaunchTaskManager startLoadTasks:ACAppLaunchTaskPriorityType_MainThreadAsyncP2];
        [ACAppLaunchTaskManager startLoadTasks:ACAppLaunchTaskPriorityType_SubThreadAsyncP0];
        [ACAppLaunchTaskManager startLoadTasks:ACAppLaunchTaskPriorityType_SubThreadAsyncP1];
        [ACAppLaunchTaskManager startLoadTasks:ACAppLaunchTaskPriorityType_SubThreadAsyncP2];
    });
}

@end
