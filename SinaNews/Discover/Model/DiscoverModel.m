//
//  DiscoverModel.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/29.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "DiscoverModel.h"
#import "DiscoverService.h"
#import "GlobleConfig.h"
#import "DiscoverDataVo.h"
#import "DiscoverItem.h"

@interface DiscoverModel ()
@property(nonatomic,strong) DiscoverService *service;
@end

@implementation DiscoverModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.service = [DiscoverService new];
    }
    return self;
}


- (void)loadData:(NSDictionary *)dic completion:(void(^)(NSDictionary *success))completion failure:(void(^)(NSDictionary *error))failure{
    kWeakSelf
    [self.service fetchDiscoverData:^(NSDictionary *dic) {
        [instance wrapperItems:dic];
        completion(nil);
    } failure:^(NSDictionary *dic) {
        
    }];
}

- (void)wrapperItems:(NSDictionary *)dic{
    NSArray *voArr = [dic objectForKey:@"voArr"];
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:voArr[0]];
    self.dataArr = arr;
}




@end
