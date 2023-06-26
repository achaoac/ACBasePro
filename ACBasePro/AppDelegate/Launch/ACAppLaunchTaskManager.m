//
//  ACAppLaunchTaskManager.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/10/26.
//

#import "ACAppLaunchTaskManager.h"

@implementation ACAppLaunchTaskManager

+ (void)startLoadTasks:(ACAppLaunchTaskPriorityType)priorityType {
    [ACAppLaunchTaskManager startLoadTasks:priorityType WithObj:nil];
}

+ (void)startLoadTasks:(ACAppLaunchTaskPriorityType)priorityType WithObj:(id _Nullable)obj {
    NSLog(@"执行启动任务，任务类型：%@", @(priorityType));
    
    ACAppLaunchTaskList *taskList = [ACAppLaunchTaskList appLaunchTaskListWithType:priorityType];
    
    switch (priorityType) {
        case ACAppLaunchTaskPriorityType_MainThreadSyncP0:
        case ACAppLaunchTaskPriorityType_AppTerminated:
            [taskList runTasksWithObj:obj];
            break;
        case ACAppLaunchTaskPriorityType_MainThreadAsyncP1:
        case ACAppLaunchTaskPriorityType_MainThreadAsyncP2:
        case ACAppLaunchTaskPriorityType_SubThreadAsyncP0:
        case ACAppLaunchTaskPriorityType_SubThreadAsyncP1:
        case ACAppLaunchTaskPriorityType_SubThreadAsyncP2:
        case ACAppLaunchTaskPriorityType_EnterBackground:
        case ACAppLaunchTaskPriorityType_EnterForground:
            [taskList runTasks];
            break;
    }
}

@end
