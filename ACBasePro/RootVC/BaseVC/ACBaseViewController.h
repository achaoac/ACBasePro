//
//  ACBaseViewController.h
//  ACBasePro
//
//  Created by achaoacwang on 2022/2/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACBaseViewController : UIViewController

@property(nonatomic, retain) UIView *naviBarView;         //导航条
@property(nonatomic, retain) UILabel *titleLab;           //标题
@property(nonatomic, retain) UIButton *rightBtn;          //导航条右边按钮

/*
 创建导航条
 @param back 是否创建返回按钮
 */
- (void)createNavigationbar:(BOOL)back;

/*
 创建右边按钮
 */
- (void)createRightButtonWithTitle:(NSString *)rightBtnTitle;

/*
 创建右边按钮
 */
- (void)createRightButtonWithImage:(NSString *)rightBtnImage;

/*
 创建返回按钮
 */
- (void)createBackButton;

/*
 右边按钮触发方法
 */
- (void)rightBtnAction:(UIButton *_Nullable)sender;

/*
 返回按钮触发方法
 */
- (void)backAction:(UIButton *_Nullable)sender;

@end

NS_ASSUME_NONNULL_END
