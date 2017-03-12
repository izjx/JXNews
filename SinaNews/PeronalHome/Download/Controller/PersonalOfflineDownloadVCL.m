//
//  PersonalOfflineDownloadVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/13.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalOfflineDownloadVCL.h"
#import "PersonnalHomeOfflineSettingVCL.h"

@interface PersonalOfflineDownloadVCL ()
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *ContentView;

@end

@implementation PersonalOfflineDownloadVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.backgroundView.backgroundColor = [UIColor blackColor];
    self.backgroundView.alpha = 0;
    self.ContentView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.ContentView.frame.size.height);
    [self performSelector:@selector(showWithAnimation) withObject:nil afterDelay:0.1];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickDownLoadBtn:)];
    [self.backgroundView addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}

- (void)showWithAnimation{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"每次缓存频道不能超过10个，请在离线下载中设置！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了确定按钮");
    }];
    [alertController addAction:action1];
    [self presentViewController:alertController animated:YES completion:^{
    }];
    [UIView animateWithDuration:0.4 animations:^{
        self.backgroundView.alpha = 0.25;
        CGRect rect = self.ContentView.frame;
        rect.origin.y = self.view.frame.size.height - rect.size.height;
        self.ContentView.frame = rect;
    }];
    
}

- (void)dismissView:(void(^)())completion{
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundView.alpha = 0;
        CGRect rect = self.ContentView.frame;
        rect.origin.y = self.view.frame.size.height;
        self.ContentView.frame = rect;
    }completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (IBAction)clickDownLoadBtn:(id)sender {
    __weak typeof(self) instance = self;
    [instance dismissView:^{
        [instance.view removeFromSuperview];
        [instance removeFromParentViewController];
    }];
}

- (void)dealloc{
    
}

- (IBAction)clickOfflineSettingBtn:(UIButton *)sender {
    UIStoryboard *personalOfflineDownload = [UIStoryboard storyboardWithName:@"PersonalOfflineDownload" bundle:nil];
    PersonnalHomeOfflineSettingVCL *offlineSettingVCL = [personalOfflineDownload instantiateViewControllerWithIdentifier:@"PersonnalHomeOfflineSettingVCL"];
    [self presentViewController:offlineSettingVCL animated:YES completion:^{
    }];
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
