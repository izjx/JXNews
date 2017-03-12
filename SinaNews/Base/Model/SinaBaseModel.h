//
//  SinaBaseModel.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinaBaseModel : NSObject

@property (nonatomic, strong) NSMutableArray *dataArr;

- (void)loadData:(NSDictionary *)dic completion:(void(^)(NSDictionary *success))completion failure:(void(^)(NSDictionary *error))failure;
@end
