//
//  PersonnalHomeOfflineSettingVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/13.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonnalHomeOfflineSettingVCL.h"
#import "PersonalHomeOfflineSettingModel.h"
#import "PersonalHomeOfflineSettingCell.h"
#import "PersonalHomeOfflineSettingCellVo.h"

@interface PersonnalHomeOfflineSettingVCL ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) CALayer *lineLayer;
@property (strong,nonatomic) PersonalHomeOfflineSettingModel *model;

@end

@implementation PersonnalHomeOfflineSettingVCL

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.model = [PersonalHomeOfflineSettingModel new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self configHeaderView];
    [self configFooterView];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
}

- (void)loadData{
    __weak typeof(self) instance = self;
    [instance.model loadData:^(NSDictionary *dic) {
        [self.tableView reloadData];
    } failure:^(NSDictionary *dic) {
        
    }];
}

- (IBAction)clickFinishBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)configHeaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 25)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc]initWithFrame:headerView.bounds];
    label.text = @"请开启您要离线的频道";
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:label];
    self.tableView.tableHeaderView = headerView;
    if (!self.lineLayer) {
        CALayer *Layer = [CALayer layer];
        Layer.frame = CGRectMake(0, headerView.frame.size.height - 0.5, self.view.frame.size.width, 0.5);
        self.lineLayer = Layer;
        self.lineLayer.backgroundColor = [UIColor grayColor].CGColor;
    [headerView.layer addSublayer:self.lineLayer];
    }
}

- (void)configFooterView{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 25, self.view.frame.size.width, 25)];
    footerView.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc]initWithFrame:footerView.bounds];
    label.text = @"离线下载图片将会消耗更多的时间和流量";
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentLeft;
    CGRect rect = label.frame;
    rect.origin.x = 15;
    label.frame = rect;
    [footerView addSubview:label];
    self.tableView.tableFooterView = footerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.model.cellDataArr.count;
    }
    return 12;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 25)];
    if (section == 0) {
        view.backgroundColor = [UIColor lightGrayColor];
        UILabel *label = [[UILabel alloc]initWithFrame:view.bounds];
        label.text = @"新闻";
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentLeft;
        CGRect rect = label.frame;
        rect.origin.x = 15;
        label.frame = rect;
        [view addSubview:label];
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonalHomeOfflineSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalHomeOfflineSettingCell"];
    id obj = self.model.cellDataArr[indexPath.row];
    if (obj && [obj isKindOfClass:[PersonalHomeOfflineSettingCellVo class]]) {
        PersonalHomeOfflineSettingCellVo *vo = (PersonalHomeOfflineSettingCellVo *)obj;
    [cell setObject:vo];
    }
    return cell;
}



@end
