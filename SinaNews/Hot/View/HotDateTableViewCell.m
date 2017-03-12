//
//  HotDateTableViewCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/16.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "HotNewsDateItem.h"
#import "HotDateTableViewCell.h"
#import "HotNewsDateItem.h"
@interface HotDateTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@end

@implementation HotDateTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setObject:(NSDictionary *)dic{
    HotNewsDateItem *item = dic[@"obj"];
    self.dateLable.text = item.date;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
