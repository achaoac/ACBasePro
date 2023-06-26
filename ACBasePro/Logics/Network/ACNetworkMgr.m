//
//  ACNetworkMgr.m
//  ACBasePro
//
//  Created by achaoacwang on 2023/6/26.
//  Copyright © 2023 achao. All rights reserved.
//

#import "ACNetworkMgr.h"
#import "AFNetworking.h"

static AFHTTPSessionManager *manager;
static dispatch_once_t onceToken;

@implementation ACNetworkMgr

+ (void)load {
    // 避免由于https握手验证导致请求过慢,[NSURLSession sharedSession]初始化则不会存在这个问题
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];// 通过sessionWithConfiguration初始化
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 15;//超时时间
    });
}

/// 获得根 url
+ (NSString *)getBaseUrl {
    return @"BaseURL";
}

/// 请求参数拼接公参
/// @param oldDic 原始参数
+ (NSDictionary *)getPublicParamDicWith:(NSDictionary *)oldDic {
    NSMutableDictionary *nDic = nil;
    if (oldDic) {
        nDic = [NSMutableDictionary dictionaryWithDictionary:oldDic];
        // 设置公参
    }
    return nDic;
}

+ (void)getRequest:(NSString *)method
        parameters:(NSDictionary * _Nullable)paramDic
           success:(void(^)(id responseObj))successBlock
           failure:(void (^)(int status,NSString *errorMessage))failureBlock {
    // 请求转化到普通接口
    if ([method hasPrefix:@"http"]) {
        [ACNetworkMgr getNormalRequest:method parameters:paramDic success:^(id  _Nonnull responseObj) {
            successBlock(responseObj);
        } failure:^(int status, NSString * _Nonnull errorMessage) {
            failureBlock(status, errorMessage);
        }];
        return;
    }
    // 拼接 url
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",[ACNetworkMgr getBaseUrl],method];
    // 拼接参数
    NSDictionary *dic = [ACNetworkMgr getPublicParamDicWith:paramDic];
    // 发起请求
    [manager GET:urlStr parameters:dic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ac_main_async(^{
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSLog(@"MFNetworkMgr request succuess");
                NSDictionary *rDic = (NSDictionary *)responseObject;
                int code = [[rDic objectForKey:@"code"] intValue];
                if (code != 1000) {
                    NSLog(@"MFNetworkMgr response error: responseObject = %@",responseObject);
                    failureBlock(code, @"返回信息格式错误");
                    return;
                }
                NSString *dataStr = [rDic objectForKey:@"token"];
                if (dataStr.length > 0) {
                    successBlock(dataStr);
                } else {
                    successBlock(responseObject);
                    return;
                }
            } else {
                NSLog(@"MFNetworkMgr response error: responseObject = %@",responseObject);
                failureBlock(-1, @"返回信息格式错误");
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ac_main_async(^{
            NSLog(@"MFNetworkMgr network error: %@", error);
            failureBlock(-1, @"网络错误");
        });
    }];
}

+ (void)getNormalRequest:(NSString *)urlStr
              parameters:(NSDictionary * _Nullable)paramDic
                 success:(void(^)(id responseObj))successBlock
                 failure:(void (^)(int status,NSString *errorMessage))failureBlock {
    // 拼接参数
    NSDictionary *dic = [ACNetworkMgr getPublicParamDicWith:paramDic];
    // 发起请求
    [manager GET:urlStr parameters:dic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ac_main_async(^{
            successBlock(responseObject);
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ac_main_async(^{
            NSLog(@"MFNetworkMgr network error: %@", error);
            failureBlock(-1, @"网络错误");
        });
    }];
}

@end
