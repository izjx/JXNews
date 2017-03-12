//
//  DiscoverDataVo.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/30.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscoverDataVo : NSObject
@property (nonatomic, copy)NSString *topColor;
@property (nonatomic, copy)NSString *pic;
@property (nonatomic, copy)NSString *shortIntro;
@property (nonatomic, copy)NSString *kPic;
@property (nonatomic, copy)NSString *topNightColor;
@property (nonatomic, copy)NSString *searchNightColor;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSString *searchColor;

+ (DiscoverDataVo *)wrapperVo:(NSDictionary *)dic;
@end
