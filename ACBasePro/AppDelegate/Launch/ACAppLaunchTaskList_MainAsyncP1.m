//
//  ACAppLaunchTaskList_MainAsyncP1.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/10/26.
//

#import "ACAppLaunchTaskList_MainAsyncP1.h"

@implementation ACAppLaunchTaskList_MainAsyncP1

- (void)runTasks {
    NSLog(@"App laucnch excute ACAppLaunchTaskList_MainAsyncP1 prepare");
    // 延迟在主线程异步执行任务
    [self performSelector:@selector(delayRunTasks) withObject:nil afterDelay:kDelayMainAsyncP1];
}

- (void)delayRunTasks {
    NSLog(@"App laucnch excute ACAppLaunchTaskList_MainAsyncP1");
    [self excuteAsyncTaskBlock:^{
    }];
}

- (dispatch_queue_t)taskQueue {
    return dispatch_get_main_queue();
}


@end
