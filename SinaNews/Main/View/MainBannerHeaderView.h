//
//  MainBannerHeaderView.h
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainBannerHeaderViewBlock)(NSString *url);

@interface MainBannerHeaderView : UIView
@property (nonatomic, copy) MainBannerHeaderViewBlock clickBlock;

- (void)configBanner:(NSArray *)bannerDateArr;

@end
