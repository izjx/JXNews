//
//  DiscoverVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/29.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "DiscoverVCL.h"
#import "MBProgressHUD.h"
#import "DiscoverModel.h"
#import "GlobleConfig.h"
#import "DiscoverItem.h"
#import "DiscoverDataVo.h"
@interface DiscoverVCL ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,weak) MBProgressHUD *hud;
@property (nonatomic,strong) DiscoverModel *model;
@end

@implementation DiscoverVCL

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.model= [DiscoverModel new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
}

- (void)configWebView{
    if (!self.model.dataArr || self.model.dataArr.count == 0) {
        return;
    }
    DiscoverDataVo *vo = self.model.dataArr[0];
    self.urlString = vo.url;
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    self.hud = hud;
    hud.labelText = @"加载中";
    [hud show:YES];
    [self.webView loadRequest:urlRequest];
    self.webView.delegate = self;
}

- (void)loadData{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    hud.labelText = @"加载中";
    [hud show:YES];
    kWeakSelf
    [self.model loadData:nil completion:^(NSDictionary *success) {
        [instance configWebView];

        [hud hide:YES];
    } failure:^(NSDictionary *error) {
        [hud hide:YES];

    }];
}
    // Do any additional setup after loading the view.


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.hud hide:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.hud hide:YES];
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
