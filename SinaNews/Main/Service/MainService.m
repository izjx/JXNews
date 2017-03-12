//
//  MainService.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/13.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "MainService.h"

#import "AFHTTPSessionManager.h"
#import "GlobleConfig.h"
#import "MainCategoryVo.h"
@implementation MainService
- (void)fetchMainNewsListData:(NSDictionary *)dic success:(void(^)(NSDictionary* dic))success failure:(void(^)(NSDictionary* dic))failure{
    NSNumber *pageNumber = dic[@"p"];
    NSString *url;
    if (pageNumber.integerValue == 1) {
        url = @"http://newsapi.sina.cn/?resource=feed&accessToken=2.00ttkRxBe3vYNC2dc329e216D6fQiD&chwm=3023_0001&city=&connectionType=0&deviceId=c49599acd991fe77cf2288f6ebb3c954f2d6784f&deviceModel=apple-iphone6&from=6056193012&idfa=54130B5E-B4A1-4B5A-B058-4268F1E547A1&idfv=2F053E4E-5DB3-4770-AAED-BA313EEE5179&imei=c49599acd991fe77cf2288f6ebb3c954f2d6784f&location=0.000000%2C0.000000&osVersion=10.0.1&resolution=750x1334&sfaId=c49599acd991fe77cf2288f6ebb3c954f2d6784f&token=4ba8b5d11a793cb77b0ccf18fd8ce9d99d440c2325de9ab18b364c50a4169c4c&ua=apple-iphone6__SinaNews__5.6.1__iphone__10.0.1&weiboSuid=db9d644fdf&weiboUid=1792168521&wm=b207&rand=704&urlSign=e46b6a8af6&behavior=auto&channel=news_toutiao&downTimes=1&lastTimestamp=&listCount=0&p=1&pullDirection=down&pullTimes=1&replacedFlag=0&s=20&upTimes=0";
    }else if(pageNumber.integerValue == 2){
        url = @"http://newsapi.sina.cn/?resource=feed&accessToken=2.00ttkRxBe3vYNC2dc329e216D6fQiD&chwm=3023_0001&city=&connectionType=2&deviceId=c49599acd991fe77cf2288f6ebb3c954f2d6784f&deviceModel=apple-iphone6&from=6056193012&idfa=54130B5E-B4A1-4B5A-B058-4268F1E547A1&idfv=2F053E4E-5DB3-4770-AAED-BA313EEE5179&imei=c49599acd991fe77cf2288f6ebb3c954f2d6784f&location=0.000000%2C0.000000&osVersion=10.0.1&resolution=750x1334&sfaId=c49599acd991fe77cf2288f6ebb3c954f2d6784f&token=4ba8b5d11a793cb77b0ccf18fd8ce9d99d440c2325de9ab18b364c50a4169c4c&ua=apple-iphone6__SinaNews__5.6.1__iphone__10.0.1&weiboSuid=db9d644fdf&weiboUid=1792168521&wm=b207&rand=409&urlSign=82efd6abd0&behavior=manual&channel=news_toutiao&downTimes=1&lastTimestamp=1482645602&listCount=21&p=2&pullDirection=up&pullTimes=1&replacedFlag=0&s=20&upTimes=1";
    }else if(pageNumber.integerValue == 3){
        url = @"http://newsapi.sina.cn/?resource=feed&accessToken=2.00ttkRxBe3vYNC2dc329e216D6fQiD&chwm=3023_0001&city=&connectionType=2&deviceId=c49599acd991fe77cf2288f6ebb3c954f2d6784f&deviceModel=apple-iphone6&from=6056193012&idfa=54130B5E-B4A1-4B5A-B058-4268F1E547A1&idfv=2F053E4E-5DB3-4770-AAED-BA313EEE5179&imei=c49599acd991fe77cf2288f6ebb3c954f2d6784f&location=0.000000%2C0.000000&osVersion=10.0.1&resolution=750x1334&sfaId=c49599acd991fe77cf2288f6ebb3c954f2d6784f&token=4ba8b5d11a793cb77b0ccf18fd8ce9d99d440c2325de9ab18b364c50a4169c4c&ua=apple-iphone6__SinaNews__5.6.1__iphone__10.0.1&weiboSuid=db9d644fdf&weiboUid=1792168521&wm=b207&rand=457&urlSign=bfaa55d413&behavior=manual&channel=news_toutiao&downTimes=1&lastTimestamp=1482645654&listCount=31&p=3&pullDirection=up&pullTimes=2&replacedFlag=0&s=20&upTimes=2";
    }else{
        url = @"http://newsapi.sina.cn/?resource=feed&accessToken=2.00ttkRxBe3vYNC2dc329e216D6fQiD&chwm=3023_0001&city=&connectionType=2&deviceId=c49599acd991fe77cf2288f6ebb3c954f2d6784f&deviceModel=apple-iphone6&from=6056193012&idfa=54130B5E-B4A1-4B5A-B058-4268F1E547A1&idfv=2F053E4E-5DB3-4770-AAED-BA313EEE5179&imei=c49599acd991fe77cf2288f6ebb3c954f2d6784f&location=0.000000%2C0.000000&osVersion=10.0.1&resolution=750x1334&sfaId=c49599acd991fe77cf2288f6ebb3c954f2d6784f&token=4ba8b5d11a793cb77b0ccf18fd8ce9d99d440c2325de9ab18b364c50a4169c4c&ua=apple-iphone6__SinaNews__5.6.1__iphone__10.0.1&weiboSuid=db9d644fdf&weiboUid=1792168521&wm=b207&rand=875&urlSign=7f68c1cc8d&behavior=manual&channel=news_toutiao&downTimes=1&lastTimestamp=1482647971&listCount=41&p=4&pullDirection=up&pullTimes=3&replacedFlag=0&s=20&upTimes=3";
    }

    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        failure(nil);
    }];
    
}
- (void)fetchMainCategoryData:(void(^)(NSDictionary* dic))success failure:(void(^)(NSDictionary* dic))failure{
    NSString *url = @"http://newsapi.sina.cn/?resource=nav/newsList&accessToken=2.00ttkRxBe3vYNC2dc329e216D6fQiD&chwm=3023_0001&city=&connectionType=0&deviceId=c49599acd991fe77cf2288f6ebb3c954336c79d3&deviceModel=apple-iphone6&from=6056193012&idfa=54130B5E-B4A1-4B5A-B058-4268F1E547A1&idfv=2F053E4E-5DB3-4770-AAED-BA313EEE5179&imei=c49599acd991fe77cf2288f6ebb3c954336c79d3&location=0.000000%2C0.000000&osVersion=10.0.1&resolution=750x1334&sfaId=c49599acd991fe77cf2288f6ebb3c954336c79d3&token=4ba8b5d11a793cb77b0ccf18fd8ce9d99d440c2325de9ab18b364c50a4169c4c&ua=apple-iphone6__SinaNews__5.6.1__iphone__10.0.1&weiboSuid=db9d644fdf&weiboUid=1792168521&wm=b207&rand=152&urlSign=e85ff9866c&modifytime=1481390534";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    kWeakSelf
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *responseDic = [instance wrapperData:responseObject];
        success(responseDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        failure(nil);
    }];

}



- (NSDictionary *)wrapperData:(NSDictionary *)dic{
    NSDictionary *data = [dic objectForKey:@"data"];
    NSDictionary *headlines = [data objectForKey:@"headlines"];
    NSArray *subscribeArr = [headlines objectForKey:@"subscribe"];
    NSMutableArray *vosArr = [NSMutableArray array];
    for (NSDictionary *categoryDic in subscribeArr) {
        MainCategoryVo *vo = [MainCategoryVo wrapperVo:categoryDic];
        [vosArr addObject:vo];
    }
    return @{@"voArr":vosArr};
}









@end
