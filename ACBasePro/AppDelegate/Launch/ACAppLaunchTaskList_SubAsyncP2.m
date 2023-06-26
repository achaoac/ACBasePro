//
//  ACAppLaunchTaskList_SubAsyncP2.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/10/26.
//

#import "ACAppLaunchTaskList_SubAsyncP2.h"

@implementation ACAppLaunchTaskList_SubAsyncP2

- (void)runTasks {
    NSLog(@"App laucnch excute ACAppLaunchTaskList_SubAsyncP2 prepare");
    // 延迟在子线程异步执行任务
    [self performSelector:@selector(delayRunTasks) withObject:nil afterDelay:kDelaySubAsyncP2];
}

- (void)delayRunTasks {
    NSLog(@"App laucnch excute ACAppLaunchTaskList_SubAsyncP2");
    // 在子线程异步执行任务
    [self excuteAsyncTaskBlock:^{
        
    }];
}

- (dispatch_queue_t)taskQueue {
    return ACGlobalSerialQueueForQOS(NSQualityOfServiceBackground);
}

@end
