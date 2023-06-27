//
//  ACSettingTableViewCell.m
//  ACBasePro
//
//  Created by achaoacwang on 2022/6/14.
//  Copyright © 2022 achaoacwang. All rights reserved.
//

#import "ACSettingTableViewCell.h"

@interface ACSettingTableViewCell ()

@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UIImageView *arrowImg;
@property (nonatomic, strong) UILabel *subNameLab;

@end

@implementation ACSettingTableViewCell

- (void)_initView {
    self.backgroundColor = [UIColor whiteColor];
    
    self.nameLab = [ACUITools createLabel:self.contentView frame:CGRectMake(16, 13, 200, 22) text:nil textColor:RGBCOLOR(30, 30, 30) font:PF_Regular_Font(15) alignment:NSTextAlignmentLeft];
    self.subNameLab = [ACUITools createLabel:self.contentView frame:CGRectMake(SCREEN_WIDTH - 36 - 250, 13, 250, 22) text:nil textColor:RGBCOLOR(153, 153, 153) font:PF_Regular_Font(15) alignment:NSTextAlignmentRight];
    self.arrowImg = [ACUITools createImage:self.contentView frame:CGRectMake(SCREEN_WIDTH - 36, 14, 20, 20) image:@"ac_icon_arrow_right"];
}

- (void)updateUI:(NSString *)name subName:(NSString *)subName subNameMedium:(BOOL)isSubNameMedium arrow:(BOOL)hasArrow {
    self.nameLab.text = name;
    if (subName.length > 0) {
        self.subNameLab.hidden = NO;
        self.subNameLab.text = subName;
        if (isSubNameMedium) {
            self.subNameLab.font = PF_Medium_Font(15);
            self.subNameLab.textColor = RGBCOLOR(30, 30, 30);
        } else {
            self.subNameLab.font = PF_Regular_Font(15);
            self.subNameLab.textColor = RGBCOLOR(153, 153, 153);
        }
    } else {
        self.subNameLab.hidden = YES;
    }
    self.arrowImg.hidden = !hasArrow;
}
@end
