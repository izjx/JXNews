//
//  PersonalHomeOfflineSettingCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/13.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeOfflineSettingCell.h"
#import "PersonalHomeOfflineSettingCellVo.h"
@interface PersonalHomeOfflineSettingCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UISwitch *offlineSettingSwitch;


@end

@implementation PersonalHomeOfflineSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setObject:(PersonalHomeOfflineSettingCellVo *)vo{
    NSString *titleLable = vo.titleLable;
    BOOL switchState = vo.switchState;
    self.titleLable.text = titleLable;
    self.offlineSettingSwitch.on = switchState;
    
    
    
    
    
//    if (!_lineLayer){
//        CALayer *Layer = [CALayer layer];
//        CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
//        CGFloat cellHeight = self.frame.size.height;
//        Layer.frame = CGRectMake(8, cellHeight - 0.5 ,cellWidth - 16, 0.4);
//        self.lineLayer = Layer;
//        //.cgcolor??
//        self.lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
//        [self.layer addSublayer:self.lineLayer];
//    }
}

- (void)prepareForReuse{
    
    self.titleLable.text = @"";
    self.offlineSettingSwitch.on = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
