//
//  SceneDelegate.m
//  ACBasePro
//
//  Created by achaoacwang on 2023/6/26.
//

#import "SceneDelegate.h"
#import "ACRootNavigationController.h"
#import "ACRootViewController.h"
#import "ACAppLaunchTaskManager.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // 初始化window
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [UIApplication sharedApplication].delegate.window = self.window;
    
    // 初始化rootVC
    self.window.rootViewController = [[ACRootNavigationController alloc] initWithRootViewController:[[ACRootViewController alloc] init]];
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // 执行app挂起的任务
    [ACAppLaunchTaskManager startLoadTasks:ACAppLaunchTaskPriorityType_AppTerminated];
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // 执行进入前台的任务
    [ACAppLaunchTaskManager startLoadTasks:ACAppLaunchTaskPriorityType_EnterForground];
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // 执行进入后台的任务
    [ACAppLaunchTaskManager startLoadTasks:ACAppLaunchTaskPriorityType_EnterBackground];
}

@end
