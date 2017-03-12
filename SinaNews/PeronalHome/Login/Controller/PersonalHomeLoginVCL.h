//
//  PersonalHomeLoginVCL.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/29.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <UIKit/UIKit.h>
//1.自定义代理
@protocol PersonalHomeLoginVCLDelegate <NSObject>

- (void)didLoginSuccess:(NSString *)userName;

@end

//1.定义一个block
typedef void(^PersonalHomeLoginVCLDidLoginBlock)(NSString *userName);

@interface PersonalHomeLoginVCL : UIViewController
//2.声明一个代理的属性
@property (nonatomic,weak) id <PersonalHomeLoginVCLDelegate> delegate;
//2.声明一个block类型的属性，必须是copy
@property (nonatomic ,copy) PersonalHomeLoginVCLDidLoginBlock loginBlock;
@end
