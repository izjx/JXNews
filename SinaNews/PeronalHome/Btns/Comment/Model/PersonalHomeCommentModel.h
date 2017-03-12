//
//  PersonalHomeCommentModel.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SinaBaseModel.h"

typedef NS_ENUM(NSUInteger, PersonalHomeCommentType) {
    PersonalHomeCommentTypeResponse = 1000, //回复我的
    PersonalHomeCommentTypeSend = 1001,   //我发的评论
};
@interface PersonalHomeCommentModel : SinaBaseModel

@end
