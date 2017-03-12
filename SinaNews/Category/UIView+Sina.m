//
//  UIView+Sina.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/21.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "UIView+Sina.h"

@implementation UIView (Sina)

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
@end
