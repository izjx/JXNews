//
//  HotNewsDetailVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/27.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "HotNewsDetailVCL.h"
#import "MBProgressHUD.h"

//NSString *const SinaNewsDetailDidLoadFinishNotifictaion = @"SinaNewsDetailDidLoadFinishNotifictaion";


@interface HotNewsDetailVCL ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,weak) MBProgressHUD *hud;
@end

@implementation HotNewsDetailVCL

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
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [self.webView.scrollView setContentInset:UIEdgeInsetsZero];
    
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.hud hide:YES];
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
