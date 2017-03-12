//
//  PersonalHomeLoginVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/10/29.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeLoginVCL.h"
#import "PersonalRegisterVCL.h"

@interface PersonalHomeLoginVCL ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *inputBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (nonatomic,copy)NSString *account;
@property (nonatomic,copy)NSString *password;
@end

@implementation PersonalHomeLoginVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.inputBackgroundView.layer setBorderWidth:0.5];
    [self.inputBackgroundView.layer setCornerRadius:3];
    //因为是layer，所以CGcolor
    [self.inputBackgroundView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.loginBtn.layer setCornerRadius:3];
    //键盘自动弹出
    self.accountTF.delegate = self;
    self.passwordTF.delegate = self;
    [self.accountTF becomeFirstResponder];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)registerAction:(id)sender {
    //跳转页面
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalRegisterVCL *vcl = [mainStory instantiateViewControllerWithIdentifier:@"PersonalRegisterVCL"];
    [self.navigationController pushViewController:vcl animated:YES];

}

- (IBAction)forgetPassword:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"找回密码" message:@"┗|｀O′|┛ 嗷~~还没实现这个功能" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了确定按钮");
    }];
    [alertController addAction:action1];
    [self presentViewController:alertController animated:YES completion:^{
    }];
}
//点击登录事件
- (IBAction)loginAction:(id)sender {
    [self.accountTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
    BOOL success = [self checkUserInfo];
    if (success) {
        //3.调代理，需要判断代理有没有，并判断有没有实现其中的方法；
        //代理实现的要求：delegate存在，并且实现其中的方法
//        if (self.delegate && [self.delegate respondsToSelector:@selector(didLoginSuccess:)]) {
//            [self.delegate didLoginSuccess:self.account];
//        }
        //3.在该调用的地方调用一下，需要先判断下block有没有
        if (self.loginBlock) {
            self.loginBlock(self.account);
        }
        [self showAlertWithTitle:@"恭喜你" message:@"登陆成功" handler:^(UIAlertAction *action) {
            [self gobackDelay];
        }];
        
    } else {
        [self showAlertWithTitle:@"提示" message:@"您输入的信息有误" handler:^(UIAlertAction *action) {
        }];
    }

}
//把Alert单独设成一个函数进行调用
- (void)showAlertWithTitle:(NSString*)title  message:(NSString *)message   handler:(void (^ __nullable)(UIAlertAction *action))handler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler];
    [alertController addAction:action1];
    [self presentViewController:alertController animated:YES completion:^{
    }];

}

- (BOOL)checkUserInfo{
    //先取出输入的信息，再判断正确与否
    NSString *account = [[NSUserDefaults standardUserDefaults]objectForKey:@"userAccount"];
    NSString *password = [[NSUserDefaults standardUserDefaults]objectForKey:@"userPassword"];
    if (![account isEqualToString:self.account]) {
        return NO;
    }
    if (![password isEqualToString:self.password]) {
        return NO;
    }
    return YES;
}

- (void)gobackDelay{
    //延迟方法
    [self performSelector:@selector(back:) withObject:nil afterDelay:0.1];
}

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







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
