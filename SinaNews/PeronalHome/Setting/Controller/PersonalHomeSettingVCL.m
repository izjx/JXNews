//
//  PersonalHomeSettingVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/11.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeSettingVCL.h"
#import "PersonalHomeSettingSpecialCell.h"
#import "PersonalHomeSettingBlankCell.h"
#import "PersonalHomeSettingExplainCell.h"
#import "MJRefresh.h"
@interface PersonalHomeSettingVCL ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PersonalHomeSettingVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self addRefreshHeader];
//    self.tableView.frame = CGRectMake(0, 8, self.view.frame.size.width, self.view.frame.size.height);
    // Do any additional setup after loading the view.
}

- (void)addRefreshHeader{

}

- (void)loadData{
    
}

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalHomeSettingBlankCell"];
    }else if (indexPath.row == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalHomeSettingExplainCell"];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalHomeSettingSpecialCell"];
        if ([cell isKindOfClass:[PersonalHomeSettingSpecialCell class]]) {
            PersonalHomeSettingSpecialCell *speCell  = (PersonalHomeSettingSpecialCell *)cell;
            [speCell setObject:indexPath];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat f = 40 ;
    if (indexPath.row == 0) {
        f = 8;
    }else if (indexPath.row == 2){
        f = 30;
    }else{
        f = 40;
    }
    return f;
}

@end
