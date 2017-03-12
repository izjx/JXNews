//
//  MainVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/8.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "MainVCL.h"
#import "MainModel.h"
#import "MainBannerHeaderView.h"
#import "MainNewsCommonCell.h"
#import "MainListNewsVo.h"
#import "SinaNewsDetailVCL.h"
#import "MBProgressHUD.h"
#import "MJRefresh.h"
#import "GlobleConfig.h"
#import "MainCategoryItem.h"
@interface MainVCL ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *topCategoryScrollView;
@property (weak, nonatomic) IBOutlet UIButton *pullDownCategoryBtn;
@property (strong,nonatomic) MainModel *model;
@property (strong,nonatomic) NSMutableArray *topCategoryBtnArr;
@property (strong ,nonatomic) UIView *categoryBottomLine;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainVCL

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.model = [MainModel new];
        self.topCategoryBtnArr = [NSMutableArray new];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logNewsDetailInfo) name:SinaNewsDetailDidLoadFinishNotifictaion object:nil];
        
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)logNewsDetailInfo{
    NSLog(@"我知道加载完成了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self addRefreshHeader];
    self.topCategoryScrollView.hidden = YES;
    self.pullDownCategoryBtn.hidden = YES;
       // Do any additional setup after loading the view.
}

- (void)addRefreshHeader{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    header.stateLabel.textColor = [UIColor lightGrayColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor lightGrayColor];
    self.tableView.mj_header = header;
}

- (void)addLoadMoreFooterView{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    footer.stateLabel.textColor = [UIColor lightGrayColor];
    self.tableView.mj_footer = footer;
}

- (void)loadMore{
    self.model.pageNumber++;
    kWeakSelf
    [self.model loadData:^(NSDictionary *dic) {
        [instance.tableView.mj_footer endRefreshing];
        [instance.tableView.mj_header endRefreshing];
        [instance.tableView reloadData];
    } failure:^(NSDictionary *dic) {
        [instance.tableView.mj_footer endRefreshing];
        [instance.tableView.mj_header endRefreshing];
    }];

}

- (void)loadData{
    self.model.pageNumber = 1;
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    hud.labelText = @"加载中";
    [hud show:YES];
    
    __weak MainVCL* instance = self;
    [self.model loadData:^(NSDictionary *dic) {
        [instance configTopCategoryScrollView];
        [instance configBanner];
        
        [instance addLoadMoreFooterView];
        [instance.tableView.mj_header endRefreshing];
        [instance.tableView.mj_footer endRefreshing];
        [hud hide:YES];
        [instance.tableView reloadData];
    } failure:^(NSDictionary *dic) {
        [instance.tableView.mj_header endRefreshing];
        [instance.tableView.mj_footer endRefreshing];
        [hud hide:YES];
    }];
}

- (void)configTopCategoryScrollView{
    if (!self.topCategoryScrollView.hidden) {
        return;
    }
    self.topCategoryScrollView.hidden = NO;
    self.pullDownCategoryBtn.hidden = NO;

    CGFloat btnWidth = 62;
    [self.topCategoryScrollView setContentSize:CGSizeMake(btnWidth * self.model.categoryArr.count, self.topCategoryScrollView.frame.size.height)];
    self.topCategoryScrollView.showsHorizontalScrollIndicator = NO;
    for (NSInteger i =0; i < self.model.categoryArr.count; i++) {
        MainCategoryItem *obj = self.model.categoryArr[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:obj.name forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [btn addTarget:self action:@selector(clickTopCategoryBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.topCategoryScrollView addSubview:btn];
        btn.frame = CGRectMake(i * btnWidth, 0, btnWidth, self.topCategoryScrollView.frame.size.height);
        [self.topCategoryBtnArr addObject:btn];
        if (i == 0) {
            btn.selected = YES;
            [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        }
    }
    CGFloat lineHeight = 1.5;
    self.topCategoryScrollView.delegate = self;
    self.categoryBottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.topCategoryScrollView.frame.size.height - lineHeight, 13, lineHeight)];
    self.categoryBottomLine.center = CGPointMake(btnWidth / 2, self.categoryBottomLine.center.y);
    [self.categoryBottomLine setBackgroundColor:[UIColor redColor]];
    [self.topCategoryScrollView addSubview:self.categoryBottomLine];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}

- (void)clickTopCategoryBtn:(UIButton *)sender{
    for (UIButton *btn in self.topCategoryBtnArr) {
        btn.selected = NO;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        
    }
    sender.selected = YES;
    [sender.titleLabel setFont:[UIFont systemFontOfSize:14]];
    
    CGFloat scrollViewWidth = self.topCategoryScrollView.frame.size.width;
    CGFloat btnCenterX = sender.frame.size.width/2 + sender.frame.origin.x;
    if (btnCenterX < scrollViewWidth/2) {
        [self.topCategoryScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if (self.topCategoryScrollView.contentSize.width - btnCenterX < scrollViewWidth/2){
        [self.topCategoryScrollView setContentOffset:CGPointMake(self.topCategoryScrollView.contentSize.width - scrollViewWidth, 0) animated:YES];
    }else{
        [self.topCategoryScrollView setContentOffset:CGPointMake(btnCenterX - scrollViewWidth/2,0) animated:YES];
    }
    [UIView animateWithDuration:0.3 delay:0.18 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect rect = self.categoryBottomLine.frame;
        rect.origin.x = sender.center.x - rect.size.width/2;
        self.categoryBottomLine.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)configBanner{
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"MainBannerHeaderView" owner:self options:nil];
    MainBannerHeaderView *headerView = arr[0];
    headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 178);
    [headerView configBanner:self.model.bannerDataArr];
    kWeakSelf
    headerView.clickBlock = ^(NSString *url){
        [instance openDetailNewsPage:url];
    };
    self.tableView.tableHeaderView = headerView;
}

#pragma mark tableView 代理方法

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 2;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (section == 0) {
        return self.model.cellDataArr.count;
//    }
//    if (section == 1) {
//        return 5;
//    }
//    return 0;
}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
//    if (section == 0) {
//        view.backgroundColor = [UIColor yellowColor];
//    }else {
//        view.backgroundColor = [UIColor redColor];
//    }
//    return view;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 44;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainNewsCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainNewsCommonCell"];
    id obj = self.model.cellDataArr[indexPath.row];
    if (obj && [obj isKindOfClass:[MainListNewsVo class]]) {
        MainListNewsVo *vo = (MainListNewsVo *)obj;
        [cell setObject:@{@"vo":vo}];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    id obj = self.model.cellDataArr[indexPath.row];
    if (obj && [obj isKindOfClass:[MainListNewsVo class]]) {
        MainListNewsVo *vo = (MainListNewsVo *)obj;
        [self openDetailNewsPage:vo.link];
    }
}

- (void)openDetailNewsPage:(NSString *)urlString{
    if (!urlString || urlString.length <1) {
        return;
    }
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SinaNewsDetailVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"SinaNewsDetailVCL"];
    vcl.urlString = urlString;
    [self.navigationController pushViewController:vcl animated:YES];
 }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat cellHeight = 80;
    return cellHeight;
}








@end
