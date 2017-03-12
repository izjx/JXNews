//
//  PersonalHomeFavouriteVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/15.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeFavouriteVCL.h"

@interface PersonalHomeFavouriteVCL ()

@end

@implementation PersonalHomeFavouriteVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
