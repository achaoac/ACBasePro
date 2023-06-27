//
//  ACDefaultDataMgr.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/11/25.
//

#import "ACDefaultDataMgr.h"

@implementation ACDefaultDataMgr

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // 注册本地数据
        NSUserDefaults *ns = [NSUserDefaults standardUserDefaults];
        [ns registerDefaults:@{ACShowDebugBtn: @(false)}];
    }
    return self;
}

- (void)configGlobalDefaultData {
    NSUserDefaults *ns = [NSUserDefaults standardUserDefaults];
    self.showDebugBtn = [[ns objectForKey:ACShowDebugBtn] boolValue];
}

+ (void)changeDebugEnter:(BOOL)show {
    NSUserDefaults *ns = [NSUserDefaults standardUserDefaults];
    [ns setBool:show forKey:ACShowDebugBtn];
    [ns synchronize];
    [ACDefaultDataMgr sharedInstance].showDebugBtn = show;
}

@end
