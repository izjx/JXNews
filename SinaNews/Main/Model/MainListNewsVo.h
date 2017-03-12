//
//  MainListNewsVo.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/13.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainListNewsVo : NSObject
@property(nonatomic, copy) NSString *newsId;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *link;
@property(nonatomic, copy) NSString *kpic;
@property(nonatomic, strong) NSNumber *comment;


@end
