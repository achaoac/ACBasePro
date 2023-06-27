//
//  ACWebView.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/12/11.
//  Copyright © 2022 achaoacwang All rights reserved.
//

#import "ACWebView.h"
#import <WebKit/WebKit.h>

@interface ACWebView () <WKNavigationDelegate,WKUIDelegate>

@property (nonatomic, strong) WKWebView *web;
@property (nonatomic, assign) BOOL isAllowJump;
@property (nonatomic, strong) UIImageView *loadingView;
@property (nonatomic, strong) WKUserContentController *userContentController;
@property (nonatomic,strong)NSString *urlStr;

@end

@implementation ACWebView

- (instancetype)initWithFrame:(CGRect)frame url:(NSString *)url {
    if (self = [super initWithFrame:frame]) {
        self.isAllowJump = YES;
        [self loadDataWith:url];
    }
    return self;
}

- (void)loadDataWith:(NSString *)urlStr {
    if (!self.web) {
        self.urlStr = urlStr;
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = userContentController;
        WKWebView *web = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, gw(self), gh(self)) configuration:configuration];
        web.navigationDelegate = self;
        web.UIDelegate = self;
        [self addSubview:web];
        self.web = web;
        self.userContentController = userContentController;
        
        self.loadingView = [ACUITools createImage:self frame:self.web.frame image:@"ac_img_webview_loading"];
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [self.web loadRequest:request];
}

// 是否允许跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if (self.isAllowJump ||[webView.URL.absoluteString isEqualToString:navigationAction.request.URL.absoluteString]) {
        decisionHandler(WKNavigationActionPolicyAllow);
    } else {
        decisionHandler(WKNavigationActionPolicyCancel);
    }
}

// 加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.loadingView.hidden = YES;
}

// 加载出错
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
}

@end
