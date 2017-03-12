//
//  HotSpecialTableViewCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/16.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "HotSpecialTableViewCell.h"
#import "HotNewsItem.h"
#import <UIImageView+AFNetworking.h>
@interface HotSpecialTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLable;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@end
@implementation HotSpecialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clipsToBounds = NO;
    // Initialization code
}

- (void)setObject:(NSDictionary *)dic{
    HotNewsItem *item = [dic objectForKey:@"obj"];
    self.titleLable.text = item.title;
    self.subtitleLable.text = item.subTitle;
    [self.topImageView setImageWithURL:[NSURL URLWithString:item.pic]];
}


- (void)layoutSubviews{
    self.topImageView.frame = CGRectMake(0, -130, self.contentView.frame.size.width, self.contentView.frame.size.height + 130);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
