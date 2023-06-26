//
//  ACWebViewController.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/12/11.
//  Copyright © 2022 achaoacwang All rights reserved.
//

#import "ACWebViewController.h"
#import "ACWebView.h"

@interface ACWebViewController ()<ACRouterDelegate>

@property (nonatomic, strong) ACWebView *webView;

@end

@implementation ACWebViewController

+ (id)openJumpUrl:(NSDictionary *)params extraParams:(NSDictionary *)extraParams {
    ACWebViewController *vc = [ACWebViewController new];
    vc.urlStr = [params objectForKey:@"url"];
    vc.titleStr = [params objectForKey:@"title"];
    [ACRouter pushVC:vc];
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationbar:YES];
    self.titleLab.text = self.titleStr;
    
    self.webView = [[ACWebView alloc] initWithFrame:CGRectMake(0, NAVI_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVI_BAR_HEIGHT) url:self.urlStr];
    [self.view addSubview:self.webView];
}

- (void)backAction:(UIButton *)sender {
    [ACRouter dismissVC:self];
}

@end
