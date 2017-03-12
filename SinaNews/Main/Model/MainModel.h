//
//  MainModel.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/9/26.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MainModel : NSObject

@property(nonatomic,assign)NSInteger pageNumber;
@property(nonatomic,strong)NSMutableArray *categoryArr;
@property(nonatomic,strong)NSArray *bannerDataArr;
@property(nonatomic,strong)NSMutableArray *cellDataArr;

- (void)loadData:(void(^)(NSDictionary *dic))completion failure:(void(^)(NSDictionary *dic))failure;

//- (void)loadCategory:(void(^)(NSDictionary *dic))completion failure:(void(^)(NSDictionary *dic))failure;


@end
