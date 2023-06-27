//
//  ACDevViewController.m
//  ACBasePro
//
//  Created by achaoacwang on 2023/6/26.
//  Copyright © 2023 achao. All rights reserved.
//

#import "ACDevViewController.h"

@interface ACDevViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ACDevViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationbar:YES];
    self.titleLab.text = @"调试";
    [self _initData];
    [self _initView];
}

- (void)_initData {
    self.dataArr = @[@"111"];
}

- (void)_initView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVI_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVI_BAR_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 44;
    UIView *fView = [[UIView alloc] init];
    fView.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:fView];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSString *title = self.dataArr[indexPath.row];
    switch (indexPath.row) {
        case 0: {
            title = @"TEST";
        }
            break;
        default:
            break;
    }
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            
        }
            break;
        default:
            break;
    }
}

@end
