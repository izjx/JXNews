//
//  MainService.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/13.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MainService : NSObject

- (void)fetchMainNewsListData:(NSDictionary *)dic success:(void(^)(NSDictionary* dic))success failure:(void(^)(NSDictionary* dic))failure;
- (void)fetchMainCategoryData:(void(^)(NSDictionary* dic))success failure:(void(^)(NSDictionary* dic))failure;


@end
