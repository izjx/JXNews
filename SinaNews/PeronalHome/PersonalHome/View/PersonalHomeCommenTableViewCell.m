//
//  PersonalHomeCommenTableViewCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/17.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeCommenTableViewCell.h"
#import "GlobleConfig.h"
@interface PersonalHomeCommenTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong,nonatomic)CALayer *lineLayer;
@end

@implementation PersonalHomeCommenTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObject:(NSIndexPath *)indexPath{
    if (indexPath.row == 4) {
        _type = PersonalHomeCommenTableViewCellTypeDownLoad;
        self.titleLabel.text = @"离线下载";
        self.image.image = [UIImage imageNamed:@"download"];
    }
    if (indexPath.row == 5) {
        _type = PersonalHomeCommenTableViewCellTypeSetting  ;
        self.titleLabel.text = @"更多设置";
        self.image.image = [UIImage imageNamed:@"setting"];
    }
    if (indexPath.row == 7) {
        _type = PersonalHomeCommenTableViewCellTypeComment;
        self.titleLabel.text = @"评分";
        self.image.image = [UIImage imageNamed:@"pingfen"];
    }
    if (indexPath.row == 8) {
        _type = PersonalHomeCommenTableViewCellTypeFeedBack;
        self.titleLabel.text = @"帮助与反馈";
        self.image.image = [UIImage imageNamed:@"pencil"];
    }
    if (indexPath.row == 9) {
        _type = PersonalHomeCommenTableViewCellTypeAbout;
        self.titleLabel.text = @"关于";
        self.image.image = [UIImage imageNamed:@"about"];
    }
    if (!_lineLayer && indexPath.row != 5 && indexPath.row != 9){
        CALayer *Layer = [CALayer layer];
        CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
        Layer.frame = CGRectMake(50, 40 - 0.5 , cellWidth - 50, 0.5);
        self.lineLayer = Layer;
        //.cgcolor??
        self.lineLayer.backgroundColor = SinaColorCellSeparator().CGColor;
        [self.layer addSublayer:self.lineLayer];
    }

}
@end
