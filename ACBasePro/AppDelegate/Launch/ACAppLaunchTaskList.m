//
//  ACAppLaunchTaskList.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/10/26.
//

#import "ACAppLaunchTaskList.h"
#import "ACAppLaunchTaskList_AppTerminate.h"
#import "ACAppLaunchTaskList_EnterForeground.h"
#import "ACAppLaunchTaskList_EnterBackground.h"
#import "ACAppLaunchTaskList_MainSyncP0.h"
#import "ACAppLaunchTaskList_MainAsyncP1.h"
#import "ACAppLaunchTaskList_MainAsyncP2.h"
#import "ACAppLaunchTaskList_SubAsyncP0.h"
#import "ACAppLaunchTaskList_SubAsyncP1.h"
#import "ACAppLaunchTaskList_SubAsyncP2.h"

@implementation ACAppLaunchTaskList

+ (ACAppLaunchTaskList *)appLaunchTaskListWithType:(ACAppLaunchTaskPriorityType)type {
    static ACAppLaunchTaskList *appLaunchTaskList[9] = {0};

    switch (type) {
        case ACAppLaunchTaskPriorityType_MainThreadSyncP0: {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                appLaunchTaskList[0] = [[ACAppLaunchTaskList_MainSyncP0 alloc] init];
            });
            return appLaunchTaskList[0];
        }
            break;

        case ACAppLaunchTaskPriorityType_MainThreadAsyncP1: {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                appLaunchTaskList[1] = [[ACAppLaunchTaskList_MainAsyncP1 alloc] init];
            });
            return appLaunchTaskList[1];
        }
            break;
            
        case ACAppLaunchTaskPriorityType_MainThreadAsyncP2: {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                appLaunchTaskList[2] = [[ACAppLaunchTaskList_MainAsyncP2 alloc] init];
            });
            return appLaunchTaskList[2];
        }
            
        case ACAppLaunchTaskPriorityType_SubThreadAsyncP0: {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                appLaunchTaskList[3] = [[ACAppLaunchTaskList_SubAsyncP0 alloc] init];
            });
            return appLaunchTaskList[3];
        }
            break;

        case ACAppLaunchTaskPriorityType_SubThreadAsyncP1: {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                appLaunchTaskList[4] = [[ACAppLaunchTaskList_SubAsyncP1 alloc] init];
            });
            return appLaunchTaskList[4];
        }
            break;

        case ACAppLaunchTaskPriorityType_SubThreadAsyncP2: {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                appLaunchTaskList[5] = [[ACAppLaunchTaskList_SubAsyncP2 alloc] init];
            });
            return appLaunchTaskList[5];
        }
            break;

        case ACAppLaunchTaskPriorityType_EnterBackground: {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                appLaunchTaskList[6] = [[ACAppLaunchTaskList_EnterBackground alloc] init];
            });
            return appLaunchTaskList[6];
        }
            break;

        case ACAppLaunchTaskPriorityType_EnterForground: {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                appLaunchTaskList[7] = [[ACAppLaunchTaskList_EnterForeground alloc] init];
            });
            return appLaunchTaskList[7];
        }
            break;

        case ACAppLaunchTaskPriorityType_AppTerminated: {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                appLaunchTaskList[8] = [[ACAppLaunchTaskList_AppTerminate alloc] init];
            });
            return appLaunchTaskList[8];
        }
            break;
    }

    return nil;
}

- (void)runTasks {
    NSAssert(nil, @"Should Call runTasks In SubClass!!!");
}

- (void)runTasksWithObj:(id)obj {
    NSAssert(nil, @"Should Call runTasksWithObj: In SubClass!!!");
}

- (dispatch_queue_t)taskQueue {
    NSAssert(nil, @"Should Call taskQueue: In SubClass!!!");
    return nil;
}

#pragma mark - 子类调用
- (void)excuteAsyncTaskBlock:(void (^)(void))taskBlock {
    dispatch_async([self taskQueue], taskBlock);
}

@end
