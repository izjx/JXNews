//
//  HotService.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotService : NSObject
- (void)fetchHotNewsListData:(void(^)(NSDictionary* dic))success failure:(void(^)(NSDictionary* dic))failure;

@end
