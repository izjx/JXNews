//
//  PersonalHomeBtnsTableViewCell.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/17.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonalHomeBtnsCellDelegate <NSObject>

@optional
- (void)clickFavouriteBtn;
- (void)clickCommentBtn;
- (void)clickCardBtn;
- (void)clickPointBtn;
@end

@interface PersonalHomeBtnsTableViewCell : UITableViewCell
@property (nonatomic,weak) id<PersonalHomeBtnsCellDelegate> delegate;
- (void)setObject:(NSIndexPath *)indexPath;

@end
