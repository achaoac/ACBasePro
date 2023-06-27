//
//  ACBaseViewController.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/2/14.
//

#import "ACBaseViewController.h"

@interface ACBaseViewController ()

@end

@implementation ACBaseViewController

+ (id)openJumpUrl:(NSDictionary *)params extraParams:(NSDictionary *)extraParams {
    UIViewController *vc = [[[self class] alloc] init];
    [ACRouter pushVC:vc];
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 解决横屏 scrollView自动偏移的问题
    [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    self.view.backgroundColor = VC_COLOR;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.navigationController) {
        self.navigationController.navigationBar.hidden = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@ did appear",[self class]);
}

#pragma mark - private method
- (void)createNavigationbar:(BOOL)back {
    UIView *naviBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVI_BAR_HEIGHT)];

    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(60, naviBarView.frame.size.height - 44, naviBarView.frame.size.width - 120, 44)];
    titleLab.backgroundColor = [UIColor clearColor];
    titleLab.font = [UIFont boldSystemFontOfSize:18];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor blackColor];
    [naviBarView addSubview:titleLab];
    self.titleLab = titleLab;

    naviBarView.backgroundColor = NAVI_COLOR;

    [ACUITools addPublicLine:naviBarView frame:CGRectMake(0, naviBarView.frame.size.height - 0.6, naviBarView.frame.size.width, 0.6)];

    [self.view addSubview:naviBarView];
    self.naviBarView = naviBarView;

    [self.naviBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(NAVI_BAR_HEIGHT);
    }];
    
    if (back) {
        [self createBackButton];
    }
}

- (void)createBackButton {
    [ACUITools createVariableButton:self.naviBarView frame:CGRectMake(0, self.naviBarView.frame.size.height - 44, 60, 44) title:nil image:[UIImage imageNamed:@"ac_btn_back.png"] titleRect:CGRectZero imageRect:CGRectMake(9, 9, 26, 26) font:nil titleColor:nil target:self selector:@selector(backAction:)];
}

- (void)createRightButtonWithTitle:(NSString *)rightBtnTitle {
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(self.naviBarView.frame.size.width - 60, self.naviBarView.frame.size.height - 44, 60, 44)];
    [rightBtn setTitle:rightBtnTitle forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithRed:159 / 255.0 green:159 / 255.0 blue:159 / 255.0 alpha:1] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.naviBarView addSubview:rightBtn];
    self.rightBtn = rightBtn;
}

- (void)createRightButtonWithImage:(NSString *)rightBtnImage {
    self.rightBtn = [ACUITools createVariableButton:self.naviBarView frame:CGRectMake(self.naviBarView.frame.size.width - 60, self.naviBarView.frame.size.height - 44, 60, 44) title:nil image:[UIImage imageNamed:rightBtnImage] titleRect:CGRectZero imageRect:CGRectMake(9, 2, 40, 40) font:nil titleColor:nil target:self selector:@selector(rightBtnAction:)];
}

- (void)rightBtnAction:(UIButton *_Nullable)sender {
}

- (void)backAction:(UIButton *_Nullable)sender {
    [ACRouter dismissVC:self];
}

// 支持旋转
-( BOOL)shouldAutorotate{
    return YES;
}

// 支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
