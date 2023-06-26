//
//  ACLoadingView.m
//  ACBasePro
//
//  Created by 汪超 on 2022/3/1.
//  Copyright © 2022 achaoacwang All rights reserved.
//

#import "ACLoadingView.h"
#import <YYImage/YYImage.h>
#import <YYAnimatedImageView.h>

NSString *const ACLoadingDefaultLoadingText = @"加载中...";
NSString *const ACLoadingErrorText = @"加载失败，请检查网络后重试~";
NSString *const ACLoadingRetryText = @"点击重试";
NSString *const ACLoadingGif = @"img_advice_normal";
NSString *const ACLoadingError = @"loading_no_network";

@interface ACLoadingView ()

@property (nonatomic,strong)UIButton *backBtn;
@property (nonatomic,strong)YYAnimatedImageView *animView;
@property (nonatomic,strong)UILabel *loadingLab;
@property (nonatomic,strong)UILabel *errorLab;
@property (nonatomic,strong)UIImageView *errorView;
@property (nonatomic,strong)UIButton *retryBtn;
@property (nonatomic,assign)CGRect aniFrame;
@property (nonatomic,assign)CGRect errorFrame;

@end

@implementation ACLoadingView

-(void)dealloc{
    NSLog(@"ACLoadingView dealloc");
}

+ (ACLoadingView *)createACLoadingViewWith:(UIView *)spView type:(ACLoadingType)type frame:(CGRect)frame{
    ACLoadingView *v = [[ACLoadingView alloc] initWithFrame:frame type:type];
    [spView addSubview:v];
    return v;
}

-(instancetype)initWithFrame:(CGRect)frame type:(ACLoadingType)type{
    if (self = [super initWithFrame:frame]) {
        //默认居中
        float ani_w = 100;
        float ani_h = 100;
        float error_w = 100;
        float error_h = 100;
        self.aniFrame = CGRectMake((gw(self) - ani_w)/2.0, (gh(self) - ani_h)/2.0 - 80, ani_w, ani_h);
        self.errorFrame = CGRectMake((gw(self) - error_w)/2.0, (gh(self) - error_h)/2.0 - 80, error_w, error_h);
        switch (type) {
            case ACLoadingType_FullPageBack:
            {
                [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                [self addSubview:self.backBtn];
                [self _initView:self.aniFrame errorFrame:self.errorFrame backgroundColor:[UIColor whiteColor]];
            }
                break;
            case ACLoadingType_CenterLoading:
            {
                [self setFrame:frame];
                [self _initView:self.aniFrame errorFrame:self.errorFrame backgroundColor:[UIColor whiteColor]];
            }
                break;
            default:
                break;
        }
    }
    return self;
}

- (void)_initView:(CGRect)aniFrame errorFrame:(CGRect)errorFrame backgroundColor:(UIColor *)color{
    self.backgroundColor = color;
    self.aniFrame = aniFrame;
    self.errorFrame = errorFrame;
}

- (void)retryButtonClickAction{
    if (self.retryBlock) {
        self.retryBlock();
    }
}

- (void)updateToErrorView{
    [self stopLoading];
    self.errorLab.text = ACLoadingErrorText;
    self.errorView.image = [UIImage imageNamed:ACLoadingError];
}

- (void)updateToLoadingView{
    [self startLoading];
}

- (void)startLoading{
    self.retryBtn.hidden = self.errorView.hidden = self.errorLab.hidden = YES;
    self.loadingLab.hidden = NO;
    self.animView.hidden = NO;
    [self.animView startAnimating];
}

- (void)stopLoading{
    self.retryBtn.hidden = self.errorView.hidden = self.errorLab.hidden = NO;
    self.loadingLab.hidden = YES;
    self.animView.hidden = YES;
    [self.animView stopAnimating];
}

- (UIButton *)retryBtn{
    if (!_retryBtn) {
        _retryBtn = [ACUITools createButton:self frame:CGRectMake((gw(self) - 122)/2.0, self.errorFrame.origin.y + self.errorFrame.size.height + 30, 122, 32) title:ACLoadingRetryText target:self selector:@selector(retryButtonClickAction)];
        _retryBtn.hidden = YES;
        _retryBtn.titleLabel.font = PF_Regular_Font(15);
        _retryBtn.backgroundColor = RGBCOLOR(47, 123, 246);
        [_retryBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_retryBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        _retryBtn.layer.cornerRadius = gh(_retryBtn) / 2.0;
        _retryBtn.layer.masksToBounds = YES;
    }
    return _retryBtn;
}

-(UILabel *)errorLab{
    if (!_errorLab) {
        _errorLab = [ACUITools createLabel:self frame:CGRectMake(0, self.errorFrame.origin.y + self.errorFrame.size.height, gw(self), 14) text:ACLoadingErrorText textColor:[UIColor blackColor] font:PF_Regular_Font(14) alignment:NSTextAlignmentCenter];
        _errorLab.hidden = YES;
    }
    return _errorLab;
}

-(UIImageView *)errorView{
    if (!_errorView) {
        _errorView = [[UIImageView alloc] initWithFrame:self.errorFrame];
        [self addSubview:_errorView];
        _errorView.hidden = YES;
    }
    return _errorView;
}

-(UILabel *)loadingLab{
    if (!_loadingLab) {
        _loadingLab = [ACUITools createLabel:self frame:CGRectMake(0, self.aniFrame.size.height + self.aniFrame.origin.y + 16, gw(self), 21) text:ACLoadingDefaultLoadingText textColor:[UIColor blackColor] font:PF_Regular_Font(15) alignment:NSTextAlignmentCenter];
        _loadingLab.hidden = YES;
    }
    return _loadingLab;
}

-(YYAnimatedImageView *)animView{
    if (!_animView) {
        _animView = [[YYAnimatedImageView alloc] initWithFrame:self.aniFrame];
        _animView.autoPlayAnimatedImage = NO;
        [self addSubview:_animView];
        _animView.image = [YYImage imageNamed:ACLoadingGif];
        _animView.hidden = YES;
    }
    return _animView;
}

-(UIButton *)backBtn{
    if (!_backBtn) {
        float y = NAVI_BAR_HEIGHT - 44;
        _backBtn = [ACUITools createVariableButton:self frame:CGRectMake(0, y, 60, 44) title:nil image:[UIImage imageNamed:@"nav_ic_back_public"] titleRect:CGRectZero imageRect:CGRectMake(9, 9, 26, 26) font:nil titleColor:nil target:self selector:@selector(backButtonClickAction)];
    }
    return _backBtn;
}

- (void)backButtonClickAction{
    if (self.backBlock) {
        self.backBlock();
    }
}

@end
