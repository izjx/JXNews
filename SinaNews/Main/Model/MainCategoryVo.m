//
//  MainCategoryVo.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/29.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "MainCategoryVo.h"

@implementation MainCategoryVo
+ (MainCategoryVo *)wrapperVo:(NSDictionary *)dic{
    MainCategoryVo *vo = [MainCategoryVo new];
    vo.categoryId = [dic objectForKey:@"id"];
    vo.name = [dic objectForKey:@"name"];
    vo.type = [dic objectForKey:@"type"];
    return vo;
}
@end
