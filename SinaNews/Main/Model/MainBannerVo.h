//
//  MainBannerVo.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/31.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainBannerVo : NSObject
@property(nonatomic, copy) NSString *intro;
@property(nonatomic, copy) NSString *pic;
@property(nonatomic, copy) NSString *commentId;
@property(nonatomic, copy) NSString *feedShowStyle;
@property(nonatomic, strong) NSString *category;
@property(nonatomic, strong) NSNumber *recommendInfo;
@property(nonatomic, copy) NSString *link;
@property(nonatomic, strong) NSString *articlePubDate;
@property(nonatomic, copy) NSString *newsId;



@end
