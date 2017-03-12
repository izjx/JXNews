//
//  PersonalHomeCommenTableViewCell.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/17.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <UIKit/UIKit.h>
//??不懂
typedef NS_ENUM(NSUInteger,PersonalHomeCommenTableViewCellType){
    PersonalHomeCommenTableViewCellTypeDownLoad = 0,
    PersonalHomeCommenTableViewCellTypeSetting,
    PersonalHomeCommenTableViewCellTypeComment,
    PersonalHomeCommenTableViewCellTypeFeedBack,
    PersonalHomeCommenTableViewCellTypeAbout,
};

@interface PersonalHomeCommenTableViewCell : UITableViewCell

@property(nonatomic)PersonalHomeCommenTableViewCellType type;

- (void)setObject:(NSIndexPath *)indexPath;



@end
