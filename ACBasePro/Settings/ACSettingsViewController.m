//
//  ACSettingsViewController.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/2/15.
//  Copyright © 2022 achaoacwang All rights reserved.
//

#import "ACSettingsViewController.h"
#import "ACSettingTableViewCell.h"

@interface ACSettingsViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) UIButton *debugBtn;

@end

@implementation ACSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationbar:YES];
    self.titleLab.text = @"设置";
    
    [self _initTableView];
    [self loadData];
    
    // 调试入口
    UIView *tapView = [ACUITools createView:self.naviBarView frame:CGRectMake((SCREEN_WIDTH - Actual_px(100)) / 2.0, NAVI_BAR_HEIGHT - 44, Actual_px(100), 44) bgColor:UIColor.clearColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickAction:)];
    tap.numberOfTapsRequired = 10;
    [tapView addGestureRecognizer:tap];
    [self updateDebugButton];
}

- (void)tapClickAction:(UITapGestureRecognizer *)tap {
    [ACDefaultDataMgr changeDebugEnter:![ACDefaultDataMgr sharedInstance].showDebugBtn];
    [self updateDebugButton];
}

- (void)updateDebugButton {
    if ([ACDefaultDataMgr sharedInstance].showDebugBtn) {
        if (!self.debugBtn) {
            self.debugBtn = [ACUITools createVariableButton:self.view frame:CGRectMake(gw(self.naviBarView) - 60, self.naviBarView.frame.size.height - 44, 56, 44) title:@"调试" image:nil titleRect:CGRectMake(0, 0, 56, 44) imageRect:CGRectZero font:PF_Regular_Font(15) titleColor:UIColor.redColor target:self selector:@selector(testAction)];
        }
    } else {
        if (self.debugBtn) {
            [self.debugBtn removeFromSuperview];
            self.debugBtn = nil;
        }
    }
}

- (void)testAction {
    [ACRouter jump:[ACRouter routerUrl:@"devVC"]];
}

- (void)_initTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVI_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVI_BAR_HEIGHT) style:UITableViewStyleGrouped];
    tableView.backgroundColor = RGBCOLOR(239, 243, 246);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 48;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)loadData {
    self.dataArr = @[
        @[
            @"隐私协议",
            [NSString stringWithFormat:@"关于「%@」", ac_appName()],
        ],
    ];
    [self.tableView reloadData];
}

- (void)updateCell:(ACSettingTableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    NSArray *arr = self.dataArr[indexPath.section];
    NSString *name = arr[indexPath.row];
    NSString *subName = nil;
    BOOL hasArrow = YES;
    BOOL isMedium = NO;
    if (indexPath.section == 0 && indexPath.row == 1) {
        subName = [NSString stringWithFormat:@"V%@",ac_appVersion()];
    }
    [cell updateUI:name subName:subName subNameMedium:isMedium arrow:hasArrow];
}

- (void)didClickCellWithIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                [ACRouter jump:[ACRouter routerUrl:@"privacyVC"]];
            }
                break;
            case 1:{
                [ACToastView showToast:@"%@(%@)",ac_appVersion(),ac_appBuildNumber()];
            }
                break;
            default:
                break;
        }
    }
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.dataArr[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ident = [ACSettingTableViewCell cellIdentifier];
    ACSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[ACSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [self updateCell:cell indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self didClickCellWithIndexPath:indexPath];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 12)];
    view.backgroundColor = RGBCOLOR(239, 243, 246);
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 48;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

@end
