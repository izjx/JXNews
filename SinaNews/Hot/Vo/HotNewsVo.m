//
//  HotNewsVo.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "HotNewsVo.h"

@implementation HotNewsVo
+ (HotNewsVo *)wrapperVo:(NSDictionary *)dic{
    HotNewsVo *vo = [HotNewsVo new];
    vo.intro = [dic objectForKey:@"intro"];
    vo.kPic = [dic objectForKey:@"kpic"];
    vo.category = [dic objectForKey:@"category"];
    vo.bigKPic = [dic objectForKey:@"bigkpic"];
    vo.newsId = [dic objectForKey:@"newsId"];
    vo.link = [dic objectForKey:@"link"];
    vo.time = [dic objectForKey:@"time"];
    vo.pic = [dic objectForKey:@"pic"];
    vo.title = [dic objectForKey:@"title"];
    vo.type = [dic objectForKey:@"type"];
    vo.bigPic = [dic objectForKey:@"bigpic"];
    
    return vo;
}
@end
