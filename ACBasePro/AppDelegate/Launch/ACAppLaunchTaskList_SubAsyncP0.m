//
//  ACAppLaunchTaskList_SubAsyncP0.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/10/26.
//

#import "ACAppLaunchTaskList_SubAsyncP0.h"

@implementation ACAppLaunchTaskList_SubAsyncP0

- (void)runTasks {
    NSLog(@"App laucnch excute ACAppLaunchTaskList_SubAsyncP0");
    // 在子线程异步执行任务
    [self excuteAsyncTaskBlock:^{

    }];
}

- (dispatch_queue_t)taskQueue {
    return ACGlobalSerialQueueForQOS(NSQualityOfServiceUserInitiated);
}

@end
