//
//  MainBannerHeaderView.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/18.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "MainBannerHeaderView.h"
#import "UIView+Sina.h"
#import "MainBannerVo.h"
#import <UIImageView+AFNetworking.h>
#import <UIButton+AFNetworking.h>
@interface MainBannerHeaderView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *bannerScorllView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *bannerImageTitleLable;
@property (strong, nonatomic) NSArray *imageArr;

//用strong 不能用copy copy的话就会复制一份变成NSArray类型

@end
@implementation MainBannerHeaderView

//- (void)setImageNameArr:(NSMutableArray *)imageNameArr{
//    _imageNameArr = [imageNameArr copy];
//    
//}

- (void)clickImageView:(UIButton *)sender{
    NSInteger index = sender.tag - 1000;
    MainBannerVo *vo = self.imageArr[index];
    if (self.clickBlock) {
        self.clickBlock(vo.link);
    }
}

- (void)configBanner:(NSArray *)bannerDataArr{
    self.bannerScorllView.delegate = self;
    if (!bannerDataArr || bannerDataArr == 0) {
        return;
    }
    self.imageArr = bannerDataArr;
    MainBannerVo *firstVo = bannerDataArr[0];
    self.bannerImageTitleLable.text = firstVo.intro;
    
    [self.bannerScorllView setContentSize:CGSizeMake(self.bannerScorllView.width * (bannerDataArr.count + 2), self.bannerScorllView.height)];
    for (NSInteger i = 0; i < bannerDataArr.count + 2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * self.bannerScorllView.frame.size.width,0,self.bannerScorllView.frame.size.width, self.bannerScorllView.frame.size.height);
       
        [self.bannerScorllView addSubview:button];
        
        if (i == 0) {
            button.tag = 1000;
            MainBannerVo *lastVo = bannerDataArr.lastObject;
            [button setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:lastVo.pic]];
        }else if (i == bannerDataArr.count + 1) {
            button.tag = 1000 + bannerDataArr.count -1;
            [button setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:firstVo.pic]];
        }else{
            button.tag = 1000 + i -1;
            MainBannerVo *vo = bannerDataArr[i - 1];
            [button setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:vo.pic]];
        }
         [button.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [button addTarget:self action:@selector(clickImageView:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.bannerScorllView setContentOffset:CGPointMake(self.bannerScorllView.frame.size.width, 0)];
    self.pageControl.numberOfPages = bannerDataArr.count;
    CGRect pageControlRect = self.pageControl.frame;
    pageControlRect.origin.x = self.width - pageControlRect.size.width - 30;
    self.pageControl.frame = pageControlRect;
}
////只要改变View的属性，都会重走这个方法，重新对子View布局
- (void)layoutSubviews{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    NSInteger realPage = offset / self.bannerScorllView.frame.size.width;
    NSArray *imageArr = self.imageArr;
    if (realPage == 0) {
        MainBannerVo *lastVo = imageArr.lastObject;
        [scrollView setContentOffset:CGPointMake((self.frame.size.width - 16)* imageArr.count, 0)];
        self.pageControl.currentPage = imageArr.count - 1;
        self.bannerImageTitleLable.text = lastVo.intro;
        return;
    }
    if (realPage == imageArr.count + 1) {
        MainBannerVo *firstVo = imageArr.firstObject;
        [scrollView setContentOffset:CGPointMake(self.frame.size.width - 16, 0)];
        self.pageControl.currentPage = 0;
        self.bannerImageTitleLable.text = firstVo.intro;
        return;
    }
    MainBannerVo *vo = imageArr[realPage - 1];
    self.pageControl.currentPage = realPage - 1;
    self.bannerImageTitleLable.text = vo.intro;
}
    
@end
