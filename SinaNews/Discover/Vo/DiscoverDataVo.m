//
//  DiscoverDataVo.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/30.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "DiscoverDataVo.h"

@implementation DiscoverDataVo
+ (DiscoverDataVo *)wrapperVo:(NSDictionary *)dic{
    DiscoverDataVo *vo = [DiscoverDataVo new];
    vo.topColor = [dic objectForKey:@"topColor"];
    vo.pic = [dic objectForKey:@"pic"];
    vo.shortIntro = [dic objectForKey:@"shortIntro"];
    vo.kPic = [dic objectForKey:@"kpic"];
    vo.topNightColor = [dic objectForKey:@"topNightColor"];
    vo.searchNightColor = [dic objectForKey:@"searchNightColor"];
    vo.searchColor = [dic objectForKey:@"searchColor"];
    vo.pic = [dic objectForKey:@"pic"];
    vo.name = [dic objectForKey:@"name"];
    vo.url = [dic objectForKey:@"url"];
    return vo;
}
@end
