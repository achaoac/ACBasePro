//
//  ACAppLaunchTaskList.h
//  ACBasePro
//
//  Created by achaoacwang on 2022/10/26.
//

#import <Foundation/Foundation.h>
#import "YYDispatchQueuePool.h"

NS_ASSUME_NONNULL_BEGIN

//**************************** YYDispatchQueuePool ****************************//
/**
 给定QOS情况下，YYDispatchQueuePool会根据系统CPU资源创建相应数量的队列数组，严格控制线程的数量，从而避免并发队列可能创建大量线程的问题
 队列池的创建使用者不需要理解，更多情况只需要从默认的队列池中根据QOS或者直接获取默认的任务队列
 */

/**
 从全局队列池获取默认级别的串行队列
 @return 虽然返回的是串行队列，但是任务的执行顺序并不一定是串行，
 因为该接口每次都是从队列池中选取一个串行队列返回，每次返回的队列不一定是同一个
 */
#define ACGlobalSerialQueue YYDispatchQueueGetForQOS(NSQualityOfServiceDefault)

/**
 根据QOS从全局队列池获取对应级别的串行队列
 @param qos Quality of Service 指定队列的优先级，用于系统资源调度
 NSQualityOfService 是 iOS8 及以后才提供，但是由于是枚举值，在 iOS7 上也不会有问题的
 详见 https://github.com/ibireme/YYDispatchQueuePool/issues/3
 @return 虽然返回的是串行队列，但是任务的执行顺序并不一定是串行，
 因为该接口每次都是从队列池中选取一个串行队列返回，每次返回的队列不一定是同一个
 */
#define ACGlobalSerialQueueForQOS(qos) YYDispatchQueueGetForQOS(qos)

//**************************** YYDispatchQueuePool ****************************//

static CGFloat const kDelayMainAsyncP1 = 1.5f; // MainAsyncP1 任务延迟时间
static CGFloat const kDelayMainAsyncP2 = 8.0f; // MainAsyncP2 任务延迟时间
static CGFloat const kDelaySubAsyncP1 = 1.0f; // SubAsyncP1 任务延迟时间
static CGFloat const kDelaySubAsyncP2 = 20.0f; // SubAsyncP2 任务延迟时间

typedef NS_ENUM(NSInteger, ACAppLaunchTaskPriorityType) {
    /*
     同步 主线程 P0 级任务
     appFinishLaunch 触发
     超高优先级，需要卡主线程 UI，会影响启动速度，谨慎添加
     */
    ACAppLaunchTaskPriorityType_MainThreadSyncP0,

    /*
     异步 主线程 P1 级任务
     app 主 UI 框架展示完成触发
     优先级中等，但不得不在主线程执行（比如注册 Push 通知）
     */
    ACAppLaunchTaskPriorityType_MainThreadAsyncP1,
    
    /*
     异步 主线程 P2 级任务
     app 主 UI 框架展示完成触发
     优先级较低，但需要在主线程执行，在业务使用场景前就完成好，对时间要求没那么高
     */
    ACAppLaunchTaskPriorityType_MainThreadAsyncP2,

    /*
     异步 子线程 P0 级任务
     app 主 UI 框架展示完成触发
     优先级较高，可以不卡主线程做，其他业务 or UI 对其有依赖，能尽量早做就早做
     */
    ACAppLaunchTaskPriorityType_SubThreadAsyncP0,

    /* 异步 子线程 P1 级任务
     app 主 UI 框架展示完成触发
     优先级中等，可以不卡主线程做，只要在特定场景之前完成就行
     */
    ACAppLaunchTaskPriorityType_SubThreadAsyncP1,

    /* 异步 子线程 P2 级任务
     app 主 UI 框架展示完成触发
     优先级较低，可以不卡主线程做，其他业务对其无依赖，基本随便找个时间做就行
     */
    ACAppLaunchTaskPriorityType_SubThreadAsyncP2,

    /*
     切换后台时执行的任务
     */
    ACAppLaunchTaskPriorityType_EnterBackground,

    /*
     切换前台时执行的任务
     */
    ACAppLaunchTaskPriorityType_EnterForground,
    
    /*
     App 终止时执行的任务
     */
    ACAppLaunchTaskPriorityType_AppTerminated,
};

@interface ACAppLaunchTaskList : NSObject

/**
 工厂方法，返回一个指定类型的任务列表
 @param type 任务类型
 @return 任务列表
 */
+ (ACAppLaunchTaskList *)appLaunchTaskListWithType:(ACAppLaunchTaskPriorityType)type;

/**
 子类重写，批量执行任务分类下的所有任务
 */
- (void)runTasks;

/**
 子类重写，批量执行任务分类下的所有任务，带参数
 */
- (void)runTasksWithObj:(id)obj;

/**
 子类重写，任务执行的 dispatch_queue_t
 */
- (dispatch_queue_t)taskQueue;

/**
 供子类调用，异步执行一个任务
 @param taskBlock 任务
 */
- (void)excuteAsyncTaskBlock:(void (^)(void))taskBlock;

@end

NS_ASSUME_NONNULL_END
