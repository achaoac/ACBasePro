//
//  ACNetworkMgr.h
//  ACBasePro
//
//  Created by achaoacwang on 2023/6/26.
//  Copyright © 2023 achao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACNetworkMgr : NSObject

/// GET 请求（APP定制）
/// @param method 接口名
/// @param paramDic 参数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)getRequest:(NSString *)method
        parameters:(NSDictionary * _Nullable)paramDic
           success:(void(^)(id responseObj))successBlock
           failure:(void (^)(int status,NSString *errorMessage))failureBlock;

/// GET 请求（通用）
/// @param urlStr 请求url
/// @param paramDic 参数
/// @param successBlock 成功回调
/// @param failureBlock 失败回调
+ (void)getNormalRequest:(NSString *)urlStr
              parameters:(NSDictionary * _Nullable)paramDic
                 success:(void(^)(id responseObj))successBlock
                 failure:(void (^)(int status,NSString *errorMessage))failureBlock;

@end

NS_ASSUME_NONNULL_END
