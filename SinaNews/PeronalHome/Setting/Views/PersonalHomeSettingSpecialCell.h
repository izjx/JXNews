//
//  PersonalHomeSettingSpecialCell.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/11.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,PersonalHomeSettingSpecialCellType){
    PersonalHomeSettingSpecialCellTypeHeadlineNewsPush = 0,
    PersonalHomeSettingSpecialCellTypeOnlyWiFiDownloadPicture,
    PersonalHomeSettingSpecialCellTypeWiFiAutoPlayVideo,
    PersonalHomeSettingSpecialCellTypeClearCache,
};


@interface PersonalHomeSettingSpecialCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UISwitch *settingSwitch;
@property (nonatomic)PersonalHomeSettingSpecialCellType type;

- (void)setObject:(NSIndexPath *)indexPath;
@end
