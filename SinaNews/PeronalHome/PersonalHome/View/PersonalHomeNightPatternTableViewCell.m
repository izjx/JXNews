//
//  PersonalHomeNightPatternTableViewCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/17.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeNightPatternTableViewCell.h"
#import "GlobleConfig.h"

@interface PersonalHomeNightPatternTableViewCell()
@property (strong,nonatomic)CALayer *lineLayer;
@end

@implementation PersonalHomeNightPatternTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObject:(NSIndexPath *)indexPath{
    if (!_lineLayer) {
        CALayer *Layer = [CALayer layer];
        CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat celHeight = self.frame.size.height;
        Layer.frame = CGRectMake(50, celHeight - 0.5 , cellWidth - 50, 0.5);
        self.lineLayer = Layer;
        //.cgcolor??
        self.lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.layer addSublayer:self.lineLayer];
    }
}
@end
