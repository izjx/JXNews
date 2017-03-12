//
//  HotModel.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "HotModel.h"
#import "HotService.h"
#import "HotNewsItem.h"
#import "HotNewsDateItem.h"
#import "HotNewsVo.h"
@interface HotModel ()
@property (nonatomic,strong) HotService *service;
@end

@implementation HotModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.service = [HotService new];
    }
    return self;
}

- (void)loadData:(NSDictionary *)dic completion:(void (^)(NSDictionary *))completion failure:(void (^)(NSDictionary *))failure{
    __weak typeof(self) instance = self;
    [self.service fetchHotNewsListData:^(NSDictionary *dic) {
        [instance wrapperItems:dic];
        completion(nil);
    } failure:^(NSDictionary *dic) {
        failure(dic);
    }];
}

- (void)wrapperItems:(NSDictionary *)dic{
    NSArray *voArr = [dic objectForKey:@"voArr"];
    NSMutableArray *arr = [NSMutableArray array];
    NSInteger index = 1;
    for (HotNewsVo *vo in voArr) {
        HotNewsItem *news = [HotNewsItem new];
        news.title = vo.title;
        news.subTitle = vo.intro;
        news.rank = [NSString stringWithFormat:@"%ld",index];
        if (index == 1) {
            news.pic = vo.bigKPic;
        }else{
            news.pic = vo.pic;
        }
        news.time = vo.time;
        news.link = vo.link;
        news.newsId = vo.newsId;
        [arr addObject:news];
        index++;
    }
    NSString *date = [dic objectForKey:@"listDate"];
    HotNewsDateItem *dateItem = [HotNewsDateItem new];
    dateItem.date = date;
    [arr addObject:dateItem];
    self.dataArr = arr;
}



@end
