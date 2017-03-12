//
//  AppDelegate.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/17.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

