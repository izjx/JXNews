//
//  PersonalHomeCommentModel.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeCommentModel.h"

@implementation PersonalHomeCommentModel
- (void)loadData:(NSDictionary *)dic completion:(void(^)(NSDictionary *success))completion failure:(void(^)(NSDictionary *error))failure{
    NSNumber *type = [dic objectForKey:@"type"];
    if (!type) {
        type = @(PersonalHomeCommentTypeSend);
    }
    if (type.integerValue == PersonalHomeCommentTypeSend) {
    }else{
    }
    completion(nil);
}


@end
