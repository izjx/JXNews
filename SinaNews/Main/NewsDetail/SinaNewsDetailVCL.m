//
//  SinaNewsDetailVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/23.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "SinaNewsDetailVCL.h"
#import "MBProgressHUD.h"

NSString *const SinaNewsDetailDidLoadFinishNotifictaion = @"SinaNewsDetailDidLoadFinishNotifictaion";

@interface SinaNewsDetailVCL ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,weak) MBProgressHUD *hud;
@property (strong,nonatomic) CALayer *lineLayer;
@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation SinaNewsDetailVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.urlString && self.urlString.length > 0) {
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:hud];
        self.hud = hud;
        hud.labelText = @"加载中";
        [hud show:YES];
        [self.webView loadRequest:urlRequest];
        self.webView.delegate = self;
    }
    if (!_lineLayer){
        CALayer *Layer = [CALayer layer];
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        Layer.frame = CGRectMake(0, self.topView.frame.size.height - 0.5 , width, 0.5);
        self.lineLayer = Layer;
        //.cgcolor??
        self.lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.topView.layer addSublayer:self.lineLayer];
    }
    // Do any additional setup after loading the view.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.hud hide:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:SinaNewsDetailDidLoadFinishNotifictaion object:nil];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.hud hide:YES];
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
