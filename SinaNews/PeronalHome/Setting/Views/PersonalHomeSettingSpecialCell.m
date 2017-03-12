//
//  PersonalHomeSettingSpecialCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/11.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeSettingSpecialCell.h"
@interface PersonalHomeSettingSpecialCell()
@property (strong,nonatomic) CALayer *lineLayer;
@end
@implementation PersonalHomeSettingSpecialCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObject:(NSIndexPath *)indexPath{
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
    CGRect rect = self.settingSwitch.frame;
    rect.origin.x = cellWidth - rect.size.width - 14;
    self.settingSwitch.frame = rect;
    if (indexPath.row == 1) {
        _type = PersonalHomeSettingSpecialCellTypeHeadlineNewsPush;
        self.titleLable.text = @"头条推送";
        self.settingSwitch.on = YES;
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 3) {
        self.type =
        PersonalHomeSettingSpecialCellTypeOnlyWiFiDownloadPicture;
        self.titleLable.text = @"仅Wi-Fi下载图片";
        self.settingSwitch.on = NO;
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 4) {
        self.type = PersonalHomeSettingSpecialCellTypeWiFiAutoPlayVideo;
        self.titleLable.text = @"Wi-Fi下自动播放视频";
        self.settingSwitch.on = YES;
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row == 5) {
        _type = PersonalHomeSettingSpecialCellTypeWiFiAutoPlayVideo;
        self.titleLable.text = @"正文字号";
        [self.settingSwitch removeFromSuperview];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 6) {
        self.type = PersonalHomeSettingSpecialCellTypeClearCache;
        self.titleLable.text = @"清除缓存";
        [self.settingSwitch removeFromSuperview];
        CGFloat lableWidth = 90;
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth - lableWidth - 14, 9, lableWidth, self.titleLable.frame.size.height)];
        lable.font = [UIFont systemFontOfSize:15];
        lable.textColor = [UIColor lightGrayColor];
        lable.text = @"0.7 MB";
        lable.textAlignment = NSTextAlignmentRight;
        [self addSubview:lable];
    }
    if (!_lineLayer && indexPath.row != 1 && indexPath.row != 6){
        CALayer *Layer = [CALayer layer];
        Layer.frame = CGRectMake(15, 40 - 0.5 , cellWidth - 15, 0.5);
        self.lineLayer = Layer;
        //.cgcolor??
        self.lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.layer addSublayer:self.lineLayer];
    }
}

@end
