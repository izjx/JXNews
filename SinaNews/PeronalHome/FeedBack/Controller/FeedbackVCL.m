//
//  FeedbackVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/10.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "FeedbackVCL.h"

@interface FeedbackVCL ()<UITextViewDelegate>
//@property (weak, nonatomic) IBOutlet UIView *feedbackBackgroundView;
//@property (weak, nonatomic) IBOutlet UITextView *feedbackTV;
//@property (strong,nonatomic) NSString *feedback;

@end

@implementation FeedbackVCL

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.feedbackBackgroundView.layer setBorderWidth:0.5];
//    [self.feedbackBackgroundView.layer setCornerRadius:3];
//    //因为是layer，所以CGcolor
//    [self.feedbackBackgroundView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
//    self.feedbackTV.delegate = self;
//    self.feedbackTV.text = @"请输入您的建议和意见...";
//    self.feedbackTV.editable = YES;
//    [self.feedbackTV becomeFirstResponder];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBackView)];
//    [self.view addGestureRecognizer:tap];
//    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
//    header.backgroundColor = [UIColor lightGrayColor];
//    UILabel *label = [[UILabel alloc]initWithFrame:header.bounds];
//    [header addSubview:label];
//    label.text = @"完成";
//    label.textAlignment = NSTextAlignmentCenter;
//    self.feedbackTV.inputAccessoryView = header;
    
//    [self setUpForDismissKeyboard];
    // Do any additional setup after loading the view.
}

//- (void)tapBackView{
//    [self.feedbackTV resignFirstResponder];
//}

- (IBAction)goBack:(id)sender {
//    [self.feedbackTV resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

//- (BOOL)checkUserInfo{
//    //先取出输入的信息，再判断正确与否
//    NSString *feedbackInfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"feedbackInfo"];
//
//    if (![feedbackInfo isEqualToString:self.feedback]) {
//        return NO;
//    }
//    
//    return YES;
//}
//
//- (void)gobackDelay{
//    //延迟方法
//    [self performSelector:@selector(goBack:) withObject:nil afterDelay:0.1];
//}
//
//- (void)textViewDidEndEditing:(UITextView *)textView{
//    if (textView == self.feedbackTV) {
//        self.feedback = textView.text;
//    }
//}

//- (void)setUpForDismissKeyboard{
//    NSNotification *nc = [NSNotificationCenter defaultCenter];
//    UITapGestureRecognizer *singleTapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAnywhereToDismissKeyboard:)];
//    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
//    [nc addObserverForName]
//}
//
//- (void)tapAnywhereToDismissKeyboard:(UITapGestureRecognizer *)gestureRecognizer{
//    
//}

//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
//    // 点击return，取消第一响应者，键盘消失，command+k弹出键盘
//    [self.feedbackTV resignFirstResponder];
//    return NO;
//}




//- (IBAction)send:(id)sender {
//    [self.feedbackTV resignFirstResponder];
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"发送" message:@"┗|｀O′|┛ 嗷~~还没实现这个功能" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"点击了确定按钮");
//    }];
//    [alertController addAction:action1];
//    [self presentViewController:alertController animated:YES completion:^{
//    }];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
