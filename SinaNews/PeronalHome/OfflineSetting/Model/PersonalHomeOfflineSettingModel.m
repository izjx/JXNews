//
//  PersonalHomeOfflineSettingModel.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/14.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeOfflineSettingModel.h"
#import "PersonalHomeOfflineSettingCellVo.h"

@implementation PersonalHomeOfflineSettingModel
- (void)loadData:(void(^)(NSDictionary *dic))completion failure:(void(^)(NSDictionary *dic))failure{
    NSMutableArray *dataArr = [NSMutableArray array];
    PersonalHomeOfflineSettingCellVo *vo1 = [PersonalHomeOfflineSettingCellVo new];
    vo1.titleLable = @"头条";
    vo1.switchState = YES;
    [dataArr addObject:vo1];
    PersonalHomeOfflineSettingCellVo *vo2 = [PersonalHomeOfflineSettingCellVo new];
    vo2.titleLable = @"视频";
    vo2.switchState = YES;
    [dataArr addObject:vo2];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo3 = [PersonalHomeOfflineSettingCellVo new];
    vo3.titleLable = @"视频";
    vo3.switchState = YES;
    [dataArr addObject:vo3];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo4 = [PersonalHomeOfflineSettingCellVo new];
    vo4.titleLable = @"视频";
    vo4.switchState = YES;
    [dataArr addObject:vo4];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo5 = [PersonalHomeOfflineSettingCellVo new];
    vo5.titleLable = @"视频";
    vo5.switchState = NO;
    [dataArr addObject:vo5];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo6 = [PersonalHomeOfflineSettingCellVo new];
    vo6.titleLable = @"视频";
    vo6.switchState = YES;
    [dataArr addObject:vo6];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo7 = [PersonalHomeOfflineSettingCellVo new];
    vo7.titleLable = @"视频";
    vo7.switchState = NO;
    [dataArr addObject:vo7];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo8 = [PersonalHomeOfflineSettingCellVo new];
    vo8.titleLable = @"视频";
    vo8.switchState = YES;
    [dataArr addObject:vo8];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo9 = [PersonalHomeOfflineSettingCellVo new];
    vo9.titleLable = @"视频";
    vo9.switchState = YES;
    [dataArr addObject:vo9];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo10 = [PersonalHomeOfflineSettingCellVo new];
    vo10.titleLable = @"视频";
    vo10.switchState = YES;
    [dataArr addObject:vo2];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo11 = [PersonalHomeOfflineSettingCellVo new];
    vo11.titleLable = @"视频";
    vo11.switchState = NO;
    [dataArr addObject:vo11];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo12 = [PersonalHomeOfflineSettingCellVo new];
    vo12.titleLable = @"视频";
    vo12.switchState = NO;
    [dataArr addObject:vo12];
    self.cellDataArr = dataArr;
    PersonalHomeOfflineSettingCellVo *vo13 = [PersonalHomeOfflineSettingCellVo new];
    vo13.titleLable = @"视频";
    vo13.switchState = NO;
    [dataArr addObject:vo13];
    self.cellDataArr = dataArr;
    completion(nil);
    
}



@end
