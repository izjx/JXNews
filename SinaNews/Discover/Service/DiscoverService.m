//
//  DiscoverService.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/29.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "DiscoverService.h"
#import "AFHTTPSessionManager.h"
#import "GlobleConfig.h"
#import "DiscoverDataVo.h"

@implementation DiscoverService
- (void)fetchDiscoverData:(void(^)(NSDictionary* dic))success failure:(void(^)(NSDictionary* dic))failure{
    NSString *url = @"http://newsapi.sina.cn/?resource=nav&accessToken=2.00ttkRxBe3vYNC2dc329e216D6fQiD&chwm=3023_0001&city=&connectionType=0&deviceId=c49599acd991fe77cf2288f6ebb3c954336c79d3&deviceModel=apple-iphone6&from=6056193012&idfa=54130B5E-B4A1-4B5A-B058-4268F1E547A1&idfv=2F053E4E-5DB3-4770-AAED-BA313EEE5179&imei=c49599acd991fe77cf2288f6ebb3c954336c79d3&location=0.000000%2C0.000000&osVersion=10.0.1&resolution=750x1334&sfaId=c49599acd991fe77cf2288f6ebb3c954336c79d3&token=4ba8b5d11a793cb77b0ccf18fd8ce9d99d440c2325de9ab18b364c50a4169c4c&ua=apple-iphone6__SinaNews__5.6.1__iphone__10.0.1&weiboSuid=db9d644fdf&weiboUid=1792168521&wm=b207&rand=405&urlSign=fe98a06179";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    kWeakSelf
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *responseDic = [instance wrapperData:responseObject];
        success(responseDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (NSDictionary *)wrapperData:(NSDictionary *)dic{
    NSDictionary *data = [dic objectForKey:@"data"];
    NSDictionary *discovery = [data objectForKey:@"discovery"];
    NSDictionary *detailData = [discovery objectForKey:@"data"];
//    NSString *url = [detailData objectForKey:@"url"];
    NSMutableArray *voArr = [NSMutableArray array];
    DiscoverDataVo *vo = [DiscoverDataVo wrapperVo:detailData];
    [voArr addObject:vo];
    return @{@"voArr":voArr};
}
@end
