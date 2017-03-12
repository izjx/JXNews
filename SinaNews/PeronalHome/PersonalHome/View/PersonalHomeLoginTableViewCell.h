//
//  PersonalHomeLoginTableViewCell.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/17.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <UIKit/UIKit.h>
//协议
@protocol PersonalHomeLoginCellDelegate <NSObject>

@optional
- (void)clickLoginBtn;

@end

@interface PersonalHomeLoginTableViewCell : UITableViewCell

@property (nonatomic,weak) id<PersonalHomeLoginCellDelegate> delegate;

- (void)setObject:(NSDictionary *)dic;

@end
