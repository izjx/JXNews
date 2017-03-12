//
//  HotNewsVo.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotNewsVo : NSObject

@property (nonatomic, copy)NSString *intro;
@property (nonatomic, copy)NSString *kPic;
@property (nonatomic, copy)NSString *category;
@property (nonatomic, copy)NSString *bigKPic;
@property (nonatomic, copy)NSString *newsId;
@property (nonatomic, copy)NSString *link;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, copy)NSString *pic;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *bigPic;

+ (HotNewsVo *)wrapperVo:(NSDictionary *)dic;

@end
