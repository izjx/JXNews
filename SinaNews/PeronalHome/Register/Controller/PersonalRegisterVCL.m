//
//  PersonalRegisterVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/11/6.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalRegisterVCL.h"
//view只负责展示，交互需要代理完成
@interface PersonalRegisterVCL ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (nonatomic,copy)NSString *account;
@property (nonatomic,copy)NSString *password;
@property (weak, nonatomic) IBOutlet UIView *inputBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation PersonalRegisterVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    //把delegate付给Controller
    self.accountTF.delegate = self;
    self.passwordTF.delegate = self;
    //一进入注册页面，accountTF变成第一响应者，键盘直接弹出，可直接输入account;
    [self.accountTF becomeFirstResponder];
    //设置inputBackgroundView的frame
    [self.inputBackgroundView.layer setBorderWidth:0.5];
    [self.inputBackgroundView.layer setCornerRadius:3];
    //因为是layer，所以CGcolor
    [self.inputBackgroundView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    //矩形框边角弧度
    [self.registerBtn.layer setCornerRadius:3];

    // Do any additional setup after loading the view.
}

- (IBAction)registerAction:(id)sender {
    //防止没点return直接点注册，因此下面两个方法是在点击注册时，先将键盘收起；
    [self.accountTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
    [self saveUserInfo];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册成功" message:@"恭喜你哦" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self gobackDelay];
    }];
    [alertController addAction:action1];
    [self presentViewController:alertController animated:YES completion:^{
    }];
    [self back:nil];
}

- (void)gobackDelay{
    //延迟方法
    [self performSelector:@selector(back:) withObject:nil afterDelay:0.1];
}

- (void)saveUserInfo{
    //相当于字典，将信息保存起来，方便用
    [[NSUserDefaults standardUserDefaults] setObject:self.account forKey:@"userAccount"];
    [[NSUserDefaults standardUserDefaults] setObject:self.password forKey:@"userPassword"];
}

//需要将信息保存起来，所以在输入完毕后讲信息赋值给别的变量，设成全局变量
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.accountTF) {
        self.account = textField.text;
    }else{
        self.password = textField.text;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // 点击return，取消第一响应者，键盘消失，command+k弹出键盘
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
