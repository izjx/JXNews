//
//  PersonalHomeVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/29.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeVCL.h"
#import "PersonalHomeNightPatternTableViewCell.h"
#import "PersonalHomeCommenTableViewCell.h"
#import "PersonalHomeAboutVCL.h"
#import "PersonalHomeLoginTableViewCell.h"
#import "PersonalHomeLoginVCL.h"
#import "FeedbackVCL.h"
#import "PersonalHomeSettingVCL.h"
#import "PersonalOfflineDownloadVCL.h"
#import "PersonalHomeBtnsTableViewCell.h"
#import "PersonalHomeFavouriteVCL.h"
#import "PersonalHomeCommentVCL.h"
#import "PersonalHomeCardVCL.h"
#import "PersonalHomeCardVCL.h"
//6.声明Contrller实现这个代理
@interface PersonalHomeVCL ()<UITableViewDataSource,UITableViewDelegate,PersonalHomeLoginVCLDelegate,PersonalHomeLoginCellDelegate,PersonalHomeBtnsCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy,nonatomic) NSString *userName;

@end

@implementation PersonalHomeVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    // Do any additional setup after loading the view.
}

#pragma mark 跳转方法

- (void)openLoginPage{
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalHomeLoginVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"PersonalHomeLoginVCL"];
    //4.给代理赋上值
    vcl.delegate = self;
    //解决循环引用
    __weak typeof(self) instance = self;
    //4.给block赋值
    vcl.loginBlock = ^(NSString *userName){
        NSLog(@"%@",userName);
        instance.userName = userName;
        //返回到个人中心需要刷新，重读数据，重新走一遍delegate两个方法
        [instance.tableView reloadData];
    };
    [self.navigationController pushViewController:vcl animated:YES];
}

- (void)showOfflineDownloadView{
    UINavigationController *rootVcl = (UINavigationController *)[[UIApplication sharedApplication].keyWindow rootViewController];
    UIViewController *tabVcl = rootVcl.topViewController;
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"PersonalOfflineDownload" bundle:nil];
    PersonalOfflineDownloadVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"PersonalOfflineDownloadVCL"];
    [tabVcl addChildViewController:vcl];
    [tabVcl.view addSubview:vcl.view];
}

- (void)openSettingPage{
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalHomeSettingVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"PersonalHomeSettingVCL"];
    [self.navigationController pushViewController:vcl animated:YES];
}

- (void)openFeedbackPage{
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FeedbackVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"FeedbackVCL"];
    [self.navigationController pushViewController:vcl animated:YES];
}

- (void)openAboutPage{
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalHomeAboutVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"PersonalHomeAboutVCL"];
    [self.navigationController pushViewController:vcl animated:YES];
}

- (void)openFavouritePage{
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalHomeFavouriteVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"PersonalHomeFavouriteVCL"];
    [self.navigationController pushViewController:vcl animated:YES];
}

- (void)openCommentPage{
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalHomeCommentVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"PersonalHomeCommentVCL"];
    [self.navigationController pushViewController:vcl animated:YES];
}

- (void)openCardPage{
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalHomeCardVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"PersonalHomeCardVCL"];
    [self.navigationController pushViewController:vcl animated:YES];
}

- (void)openPointPage{
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalHomeCardVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"PersonalHomeCardVCL"];
    [self.navigationController pushViewController:vcl animated:YES];
}

//自己定义的代理方法
//5.实现代理
- (void)didLoginSuccess:(NSString *)userName{
    NSLog(@"%@",userName);
    self.userName = userName;
    //返回到个人中心需要刷新，重读数据，重新走一遍delegate两个方法
    [self.tableView reloadData];
}

#pragma mark 点击按钮
- (void)clickLoginBtn{
    [self openLoginPage];
}

- (void)clickFavouriteBtn{
    [self openFavouritePage];
}

- (void)clickCommentBtn{
    [self openCommentPage];
}

- (void)clickCardBtn{
    [self openCardPage];
}

- (void)clickPointBtn{
    [self openPointPage];
}

#pragma mark tableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell isKindOfClass:[PersonalHomeLoginTableViewCell class]]) {
        PersonalHomeLoginTableViewCell *cell1 = (PersonalHomeLoginTableViewCell *)cell;
        cell1.delegate = self;
        
    }
    if ([cell isKindOfClass:[PersonalHomeBtnsTableViewCell class]]) {
        PersonalHomeBtnsTableViewCell *cell2 = (PersonalHomeBtnsTableViewCell *)cell;
        cell2.delegate = self;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell= [tableView dequeueReusableCellWithIdentifier:@"PersonalHomeLoginTableViewCell"];
        if ([cell isKindOfClass:[PersonalHomeLoginTableViewCell class]]) {
            PersonalHomeLoginTableViewCell *loginCell  = (PersonalHomeLoginTableViewCell *)cell;
            if (self.userName) {
                NSDictionary *dic = @{@"userName":self.userName};
                [loginCell setObject:dic];
            }
        }
    } else if(indexPath.row == 1) {
        cell =  [tableView dequeueReusableCellWithIdentifier:@"PersonalHomeBtnsTableViewCell"];
    }else if(indexPath.row == 3) {
        cell =  [tableView dequeueReusableCellWithIdentifier:@"PersonalHomeNightPatternTableViewCell"];
        if ([cell isKindOfClass:[PersonalHomeNightPatternTableViewCell class]]) {
            PersonalHomeNightPatternTableViewCell * speCell  = (PersonalHomeNightPatternTableViewCell *)cell;
            [speCell setObject:indexPath];
        }
    }else if(indexPath.row == 2 || indexPath.row == 6) {
        cell =  [tableView dequeueReusableCellWithIdentifier:@"PersonalHomeBlankTableViewCell"];
    }else{
        cell =  [tableView dequeueReusableCellWithIdentifier:@"PersonalHomeCommenTableViewCell"];
        if ([cell isKindOfClass:[PersonalHomeCommenTableViewCell class]]) {
            PersonalHomeCommenTableViewCell * commonCell  = (PersonalHomeCommenTableViewCell *)cell;
            [commonCell setObject:indexPath];
            
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[PersonalHomeCommenTableViewCell class]]) {
        PersonalHomeCommenTableViewCell *cell1 = (PersonalHomeCommenTableViewCell *)cell;
        if (cell1.type == PersonalHomeCommenTableViewCellTypeAbout) {
            [self openAboutPage];
        }
        if (cell1.type == PersonalHomeCommenTableViewCellTypeFeedBack) {
            [self openFeedbackPage];
        }
        if (cell1.type == PersonalHomeCommenTableViewCellTypeSetting) {
            [self openSettingPage];
        }
        if (cell1.type == PersonalHomeCommenTableViewCellTypeDownLoad) {
            [self showOfflineDownloadView];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat f = 40 ;
    if (indexPath.row == 0) {
        f = 185;
    }else if (indexPath.row == 1) {
        f = 60;
    }else if (indexPath.row == 3) {
        f = 40;
    }else if (indexPath.row == 2 || indexPath.row == 6) {
        f = 8;
    }else{
        f = 40;
    }
    return f;
}



@end
