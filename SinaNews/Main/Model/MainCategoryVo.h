//
//  MainCategoryVo.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/29.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainCategoryVo.h"

@interface MainCategoryVo : NSObject
@property(nonatomic,copy) NSString *categoryId;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *type;
+ (MainCategoryVo *)wrapperVo:(NSDictionary *)dic;
@end
