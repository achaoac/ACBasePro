//
//  ACBaseViewController.h
//  ACBasePro
//
//  Created by achaoacwang on 2022/2/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 基类
@interface ACBaseViewController : UIViewController <ACRouterDelegate>

@property(nonatomic, retain) UIView *naviBarView;         //导航条
@property(nonatomic, retain) UILabel *titleLab;           //标题
@property(nonatomic, retain) UIButton *rightBtn;          //导航条右边按钮

/// 路由协议，子类可重载
/// - Parameters:
///   - params: 参数1
///   - extraParams: 参数2
+ (id)openJumpUrl:(NSDictionary *)params extraParams:(NSDictionary *)extraParams;

/// 创建导航栏
/// - Parameter back: 是否携带返回按钮
- (void)createNavigationbar:(BOOL)back;

/// 创建右边按钮
/// - Parameter rightBtnTitle: 按钮标题
- (void)createRightButtonWithTitle:(NSString *)rightBtnTitle;

/// 创建右边按钮
/// - Parameter rightBtnImage: 图片名
- (void)createRightButtonWithImage:(NSString *)rightBtnImage;

/// 创建返回按钮
- (void)createBackButton;

/// 右边按钮触发方法
/// - Parameter sender: button
- (void)rightBtnAction:(UIButton *_Nullable)sender;

/// 返回按钮触发方法，子类可重载
/// - Parameter sender: button
- (void)backAction:(UIButton *_Nullable)sender;

@end

NS_ASSUME_NONNULL_END
