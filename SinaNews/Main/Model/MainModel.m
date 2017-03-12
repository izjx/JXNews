//
//  MainModel.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/9/26.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "MainModel.h"
#import "MainService.h"
#import "MainListNewsVo.h"
#import "GlobleConfig.h"
#import "MainCategoryItem.h"
#import "MainCategoryVo.h"
#import "MainBannerVo.h"
@interface  MainModel()

@property (nonatomic, strong) MainService *service;

@end

@implementation MainModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.service = [MainService new];
        self.pageNumber = 1;
        self.cellDataArr = [NSMutableArray array];
        self.categoryArr = [NSMutableArray array];
        
    }
    return self;
}

- (void)loadData:(void(^)(NSDictionary *dic))completion failure:(void(^)(NSDictionary *dic))failure{
    kWeakSelf
    [self getCellData:^(NSDictionary *suc) {
        completion(nil);
    } failure:^(NSDictionary *error) {
        failure(error);
    }];
    
    [self.service fetchMainCategoryData:^(NSDictionary *dic) {
        [instance wrapperItems:dic];
        completion(nil);
    } failure:^(NSDictionary *dic) {
        
    }];
    
}

- (void)wrapperItems:(NSDictionary *)dic{
    NSArray *voArr = [dic objectForKey:@"voArr"];
    NSMutableArray *arr = [NSMutableArray array];
    for (MainCategoryVo *vo in voArr) {
        MainCategoryItem *categoryItem = [MainCategoryItem new];
        
        categoryItem.name = vo.name;
        
        [arr addObject:categoryItem];
    }
    self.categoryArr = arr;
}



- (void)getCellData:(void(^)(NSDictionary* dic))success failure:(void(^)(NSDictionary* dic))failure{
    __weak typeof(self) instance = self;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@(self.pageNumber) forKey:@"p"];
    if (self.pageNumber == 1) {
        [dic setObject:@"down" forKey:@"pullDirection"];
    }else{
        [dic setObject:@"up" forKey:@"pullDirection"];
    }
    
    [self.service fetchMainNewsListData:dic success:^(NSDictionary *dic) {
        //json
        [instance wrapperData:dic];
        success(nil);
    } failure:^(NSDictionary *dic) {
        failure(dic);
    }];
}

- (void )wrapperData:(NSDictionary *)dic{
    if (!dic) {
        return;
    }
    if (self.pageNumber == 1) {
        [self.cellDataArr removeAllObjects];
    }
    NSMutableArray *dataArr = [NSMutableArray array];
    
    NSDictionary *data = dic[@"data"];
    NSArray *feedArr = data[@"feed"];
    for (NSDictionary *newsDic in feedArr) {
        MainListNewsVo *vo = [MainListNewsVo new];
        vo.title = newsDic[@"intro"];
        vo.link = newsDic[@"link"];
        vo.kpic = newsDic[@"kpic"];
        vo.comment = newsDic[@"comment"];
        [dataArr addObject:vo];
    }
    if (self.cellDataArr && self.cellDataArr.count > 0) {
        [self.cellDataArr addObjectsFromArray:dataArr];
    }else{
        self.cellDataArr = dataArr;
    }
    
    NSMutableArray *bannerArr = [NSMutableArray array];
    NSArray *focusArr = [data objectForKey:@"focus"];
    for (NSDictionary *bannerDic in focusArr) {
        MainBannerVo *vo = [MainBannerVo new];
        vo.intro = bannerDic[@"intro"];
        vo.pic = bannerDic[@"pic"];
        vo.link = bannerDic[@"link"];
        [bannerArr addObject:vo];
    }
    self.bannerDataArr = bannerArr;
}









@end
