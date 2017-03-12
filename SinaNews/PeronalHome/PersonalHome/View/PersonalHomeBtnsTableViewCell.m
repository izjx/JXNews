//
//  PersonalHomeBtnsTableViewCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/17.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeBtnsTableViewCell.h"


@interface PersonalHomeBtnsTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *favouriteBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *cardBtn;
@property (weak, nonatomic) IBOutlet UIButton *pointBtn;

@end

@implementation PersonalHomeBtnsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.favouriteBtn addTarget:self action:@selector(clickFavouriteBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.commentBtn addTarget:self action:@selector(clickCommentBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.cardBtn addTarget:self action:@selector(clickCardBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.pointBtn addTarget:self action:@selector(clickPointBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat btnWidth = [UIScreen mainScreen].bounds.size.width / 4;
    self.favouriteBtn.frame = CGRectMake(0, 0, btnWidth, self.contentView.frame.size.height);
    self.commentBtn.frame = CGRectMake(btnWidth, 0, btnWidth, self.contentView.frame.size.height);
    self.cardBtn.frame = CGRectMake(btnWidth * 2, 0, btnWidth, self.contentView.frame.size.height);
    self.pointBtn.frame = CGRectMake(btnWidth *3, 0, btnWidth, self.contentView.frame.size.height);
}

- (void)setObject:(NSIndexPath *)indexPath{
    
}

- (void)clickFavouriteBtnAction{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickFavouriteBtn)]) {
        [self.delegate clickFavouriteBtn];
    }
}

- (void)clickCommentBtnAction{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickCommentBtn)]) {
        [self.delegate clickCommentBtn];
    }
}

- (void)clickCardBtnAction{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickCardBtn)]) {
        [self.delegate clickCardBtn];
    }
}

- (void)clickPointBtnAction{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickPointBtn)]) {
        [self.delegate clickPointBtn];
    }
}





@end
