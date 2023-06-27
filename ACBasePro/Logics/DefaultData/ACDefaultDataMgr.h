//
//  ACDefaultDataMgr.h
//  ACBasePro
//
//  Created by achaoacwang on 2022/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACDefaultDataMgr : NSObject

@property (nonatomic, assign) BOOL showDebugBtn; // 是否展示调试界面

+ (instancetype)sharedInstance;

// 初始化本地数据，尽量靠前执行
- (void)configGlobalDefaultData;

// 切换调试入口展示
+ (void)changeDebugEnter:(BOOL)show;

@end

NS_ASSUME_NONNULL_END
