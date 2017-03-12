//
//  HotVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/16.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "HotVCL.h"
#import "HotModel.h"
#import "GlobleConfig.h"
#import "HotNewsItem.h"
#import "HotNewsDateItem.h"
#import "HotSpecialTableViewCell.h"
#import "HotCommonTableViewCell.h"
#import "HotDateTableViewCell.h"
#import "HotNewsDetailVCL.h"
#import "MBProgressHUD.h"
#import "MJRefresh.h"
@interface HotVCL ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) HotModel *model;
@end

@implementation HotVCL

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.model = [HotModel new];
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self loadData];
    self.tableView.frame = self.view.bounds;
    CGRect rect = self.tableView.frame;
    rect.origin.y = -20;
    rect.size.height -= 24;
    self.tableView.frame = rect;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logNewsDetailInfo) name:SinaNewsDetailDidLoadFinishNotifictaion object:nil];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
}

- (void)logNewsDetailInfo{
    NSLog(@"我知道加载完成了");
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)loadData{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    hud.labelText = @"加载中";
    [hud show:YES];
    kWeakSelf
    [self.model loadData:nil completion:^(NSDictionary *success) {
        [instance.tableView reloadData];
        [hud hide:YES];
    } failure:^(NSDictionary *error) {
        [hud hide:YES];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    id obj = self.model.dataArr[indexPath.row];

    if ([obj isKindOfClass:[HotNewsItem class]]) {
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"HotSpecialTableViewCell"];
            HotSpecialTableViewCell *cell1 = (HotSpecialTableViewCell *)cell;
            [cell1 setObject:@{@"obj":obj}];
        }else{
            cell = [tableView dequeueReusableCellWithIdentifier:@"HotCommonTableViewCell"];
            HotCommonTableViewCell *cell1 = (HotCommonTableViewCell *)cell;
            [cell1 setObject:@{@"obj":obj}];
        }
    }else if([obj isKindOfClass:[HotNewsDateItem class]]){
        cell = [tableView dequeueReusableCellWithIdentifier:@"HotDateTableViewCell"];
        HotDateTableViewCell *cell1 = (HotDateTableViewCell *)cell;
        [cell1 setObject:@{@"obj":obj}];

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    id obj = self.model.dataArr[indexPath.row];
    if (obj && [obj isKindOfClass:[HotNewsItem class]]) {
    HotNewsItem *item = (HotNewsItem *)obj;
    [self openDetailNewsPage:item.link];
        }

}

- (void)openDetailNewsPage:(NSString *)urlString{
    if (!urlString || urlString.length <1) {
        return;
    }
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HotNewsDetailVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"HotNewsDetailVCL"];
    vcl.urlString = urlString;
    [self.navigationController pushViewController:vcl animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    if (indexPath.row == 0) {
        height = 384;
    }else if (indexPath.row == 10){
        height = 100;
    }else {
        height = 192;
    }
    return height;
}

@end
