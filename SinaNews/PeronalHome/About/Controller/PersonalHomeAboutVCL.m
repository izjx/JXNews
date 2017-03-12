//
//  PersonalHomeAboutVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/19.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeAboutVCL.h"

@interface PersonalHomeAboutVCL ()
@property (nonatomic,strong)UIImageView *welcomeImageView;

@end

@implementation PersonalHomeAboutVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIImageView *)welcomeImageView{
    if (!_welcomeImageView) {
        _welcomeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"about_welcome"]];
        _welcomeImageView.frame = self.view.bounds;
        [self.view addSubview:_welcomeImageView];
        _welcomeImageView.hidden = YES;
        _welcomeImageView.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panImageView:)];
        [_welcomeImageView addGestureRecognizer:pan];
    }
    return  _welcomeImageView;
}

- (void)panImageView:(UIPanGestureRecognizer *)pan{
    CGPoint point = [pan translationInView:self.welcomeImageView];
    
    switch (pan.state) {
        case UIGestureRecognizerStateChanged:
            if (point.x < 0) {
                CGRect rect = self.welcomeImageView.frame;
                rect.origin.x = point.x;
                self.welcomeImageView.frame =rect;
            }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            if (-1 * point.x > self.view.frame.size.width / 2) {
                [UIView animateWithDuration:0.26 animations:^{
                    CGRect rect = self.welcomeImageView.frame;
                    rect.origin.x = -rect.size.width;
                   self.welcomeImageView.frame =rect;
                }completion:^(BOOL finished) {
                    self.welcomeImageView.hidden = YES;
                    CGRect rect = self.welcomeImageView.frame;
                    rect.origin.x = 0;
                    self.welcomeImageView.frame =rect;
                    [self.view sendSubviewToBack:self.welcomeImageView];
                }];
            }else{
                [UIView animateWithDuration:0.26 animations:^{
                    CGRect rect = self.welcomeImageView.frame;
                    rect.origin.x = 0;
                    self.welcomeImageView.frame =rect;
                }];
            }
        
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickWelcome:(id)sender {
    self.welcomeImageView.hidden = NO;
    [self.view bringSubviewToFront:self.welcomeImageView];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
