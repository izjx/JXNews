//
//  HotCommonTableViewCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/16.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "HotNewsItem.h"
#import "HotCommonTableViewCell.h"
#import <UIImageView+AFNetworking.h>
@interface HotCommonTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *titleBackgroundView;


@end

@implementation HotCommonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.titleBackgroundView.layer setBorderWidth:0.5];
    [self.titleBackgroundView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    // Initialization code
}

- (void)setObject:(NSDictionary *)dic{
    HotNewsItem *item = [dic objectForKey:@"obj"];
    self.rankLabel.text = item.rank;
    self.titleLabel.text = item.title;
    self.subtitleLabel.text = item.subTitle;
    self.timeLabel.text = item.time;
    [self.newsImageView setImageWithURL:[NSURL URLWithString:item.pic]];
    
}

- (void)prepareForReuse{
    self.newsImageView.image = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
