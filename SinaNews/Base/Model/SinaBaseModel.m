//
//  SinaBaseModel.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "SinaBaseModel.h"

@implementation SinaBaseModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArr = [NSMutableArray array];
    }
    return self;
}

- (void)loadData:(NSDictionary *)dic completion:(void(^)(NSDictionary *success))completion failure:(void(^)(NSDictionary *error))failure{
    
}
@end
