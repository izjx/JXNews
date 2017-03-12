//
//  PersonalHomeOfflineSettingModel.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/14.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalHomeOfflineSettingModel : NSObject
@property(nonatomic,strong) NSArray *cellDataArr;

- (void)loadData:(void(^)(NSDictionary *dic))completion failure:(void(^)(NSDictionary *dic))failure;
@end
