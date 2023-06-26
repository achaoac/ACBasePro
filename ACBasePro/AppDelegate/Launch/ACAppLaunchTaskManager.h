//
//  ACAppLaunchTaskManager.h
//  ACBasePro
//
//  Created by achaoacwang on 2022/10/26.
//

#import <Foundation/Foundation.h>
#import "ACAppLaunchTaskList.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACAppLaunchTaskManager : NSObject

/**
 开始执行对应优先级的TaskLisk
 @param priorityType 优先级
 */
+ (void)startLoadTasks:(ACAppLaunchTaskPriorityType)priorityType;

/**
 开始执行对应优先级的TaskLisk，带额外参数
 @param priorityType 优先级
 @param obj 额外参数：启动项、App终止类型等
 */
+ (void)startLoadTasks:(ACAppLaunchTaskPriorityType)priorityType WithObj:(id _Nullable)obj;

@end

NS_ASSUME_NONNULL_END
