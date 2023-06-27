//
//  ACAppLaunchTaskList_MainSyncP0.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/10/26.
//

#import "ACAppLaunchTaskList_MainSyncP0.h"

@implementation ACAppLaunchTaskList_MainSyncP0

- (void)runTasksWithObj:(id)obj {
    NSLog(@"App laucnch excute ACAppLaunchTaskList_MainSyncP0");
    // 本地环境数据初始化
    [[ACDefaultDataMgr sharedInstance] configGlobalDefaultData];
    
    // 配置路由
    [self configRouter];
}

- (void)configRouter {
    [ACRouter configRouter:@"acbase-router" classMaps:@{
        @"webVC" : @"ACWebViewController", // webVC
        @"settingsVC" : @"ACSettingsViewController", // 设置界面
        @"privacyVC" : @"ACPrivacyViewController", // 隐私协议界面
        @"devVC" : @"ACDevViewController", // 调试界面
    }];
}

@end
