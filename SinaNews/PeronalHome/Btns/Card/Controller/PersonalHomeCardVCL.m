//
//  PersonalHomeCardVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/15.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeCardVCL.h"

@interface PersonalHomeCardVCL ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (strong,nonatomic)CALayer *lineLayer;

@end

@implementation PersonalHomeCardVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_lineLayer){
        CALayer *Layer = [CALayer layer];
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        Layer.frame = CGRectMake(0, self.topView.frame.size.height - 0.5 , width, 0.5);
        self.lineLayer = Layer;
        //.cgcolor??
        self.lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.topView.layer addSublayer:self.lineLayer];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBack:(id)sender {
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
