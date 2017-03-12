//
//  MainNewsCommonCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/19.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "MainNewsCommonCell.h"
#import "MainListNewsVo.h"
#import <UIImageView+AFNetworking.h>
@interface MainNewsCommonCell()
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UIImageView *commentImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLable;
@property (strong,nonatomic)CALayer *lineLayer;
@end
@implementation MainNewsCommonCell

- (void)setObject:(NSDictionary *)dic{
    MainListNewsVo *vo = dic[@"vo"];
//    NSString *imageName = [dic objectForKey:@"imageName"];
//    NSString *newsTitle = [dic objectForKey:@"newsTitle"];
//    NSString *commentCount = [dic objectForKey:@"commentCount"];
    
    NSString *imageName = vo.kpic;
    NSString *newsTitle = vo.title;
    NSString *commentCount = vo.comment.stringValue;
    [self.newsImageView setImageWithURL:[NSURL URLWithString:imageName]];
    self.newsTitle.text = newsTitle;
    self.commentCountLable.text = commentCount;
    if (!_lineLayer){
        CALayer *Layer = [CALayer layer];
        CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat cellHeight = self.frame.size.height;
        Layer.frame = CGRectMake(8, cellHeight - 0.5 ,cellWidth - 16, 0.4);
        self.lineLayer = Layer;
        //.cgcolor??
        self.lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.layer addSublayer:self.lineLayer];
    }
}

- (void)prepareForReuse{
    self.newsImageView.image = nil;
    self.newsTitle.text = @"";
    self.commentCountLable.text = @"";
}

- (void)layoutSubviews{
    self.newsImageView.frame = CGRectMake(8, 8, self.newsImageView.frame.size.width, self.contentView.frame.size.height - 16);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
