//
//  ACPrivacyViewController.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/6/15.
//  Copyright © 2022 achaoacwang. All rights reserved.
//

#import "ACPrivacyViewController.h"

@interface ACPrivacyViewController () 

@end

@implementation ACPrivacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationbar:YES];
    self.titleLab.text = @"隐私协议";
    
    [self _initView];
}

- (void)_initView {
    NSString *str = @"（一）信息使用\n\t1、本引用不会像任何无关第三方提供、出售、出租、分享或交易您的个人信息，除非事先得到您的许可，或该第三方和本引用单独活共同为您提供服务，且在该服务结束后，其将被禁止访问包括其以前能够访问的所有这些资料。\n\t2、本应用亦不允许任何第三方以任何手段手机、编辑、出售或者无偿传播您的个人信息。任何本应用平台用户如从事上述活动，一经发现，本应用有权立即终止与该用户的服务的服务协议。\n\n（二）信息披露\n\t在如下情况下，本应用将依据您的个人意愿或法律的规定，全部或部分披露您的个人信息：\n\t1、经您事先同意，向第三方披露。\n\t2、根据法律的有关规定，或者行政、司法机构的要求，向第三方或者行政、司法机构披露。\n\n（三）信息存储和交换\n\t本应用收集的有关您的信息和资料将保存在本应用及（或）其关联的服务器上。\n\n（四）本隐私政策的更改\n\t如果决定更改隐私政策，我们会在本应用页面、以及我们认为适当的位置发布这些更改，以便您了解我们如何收集、使用您的个人信息，以及在什么情况下我们会透露这些信息。\n\n\t本应用保留随时修改本政策的权利，因此请经常查看。";
    UILabel *lab = [ACUITools createLabel:self.view frame:CGRectMake(16, NAVI_BAR_HEIGHT + 12, SCREEN_WIDTH - 32, 20) text:str textColor:UIColor.blackColor font:PF_Regular_Font(13) alignment:NSTextAlignmentLeft];
    lab.numberOfLines = 0;
    [lab sizeToFit];
}

@end
