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
    // 配置路由
    [self configRouter];
}

- (void)configRouter {
    [ACRouter configRouter:@"acbase-router" classMaps:@{
        @"testVC" : @"YYBTestViewController",
    }];
}

@end
