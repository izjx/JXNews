//
//  PersonalHomeLoginTableViewCell.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/17.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeLoginTableViewCell.h"

@interface PersonalHomeLoginTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *loginImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginTitleBtn;


@end

@implementation PersonalHomeLoginTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.loginImageBtn addTarget:self action:@selector(clickLoginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.loginTitleBtn addTarget:self action:@selector(clickLoginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    // Initialization code
}

- (void)clickLoginBtnAction{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickLoginBtn)]) {
        [self.delegate clickLoginBtn];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObject:(NSDictionary *)dic{
    NSString *username = [dic objectForKey:@"userName"];
    username = [NSString stringWithFormat:@"你好，%@",username];
    [self.loginTitleBtn setTitle:username forState:UIControlStateNormal];
}
@end
