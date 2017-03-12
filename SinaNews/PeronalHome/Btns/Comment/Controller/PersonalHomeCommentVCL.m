//
//  PersonalHomeCommentVCL.m
//  SinaNews
//
//  Created by 郑嘉成 on 2016/12/15.
//  Copyright © 2016年 郑嘉成. All rights reserved.
//

#import "PersonalHomeCommentVCL.h"
#import "PersonalHomeCommentModel.h"

@interface PersonalHomeCommentVCL () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *topCategoryScrollView;
@property (nonatomic, strong) NSMutableArray *categoryBtnArr;
@property (nonatomic, strong) UIView *categoryBottomLine;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) PersonalHomeCommentModel *model;
@property (nonatomic, assign)PersonalHomeCommentType currentCommentType;  //当前加载的评论类型

@end

@implementation PersonalHomeCommentVCL

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.categoryBtnArr = [NSMutableArray new];
        self.model = [PersonalHomeCommentModel new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTopCategoryScrollView];
    [self loadData];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    // Do any additional setup after loading the view.
}

- (void)loadData{
    __weak typeof(self) instance = self;
//    @"dfdf"
//    NSNumber *num = @(1);
//    @[@"1",@"2"];
//    @{@"2":@"1"};
//    num = [NSNumber numberWithInt:1];
    [self.model loadData:@{@"type":@(self.currentCommentType)} completion:^(NSDictionary *success) {
        [instance.tableView reloadData];
    } failure:^(NSDictionary *error) {
        
    }];
}

- (IBAction)goBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configTopCategoryScrollView{
    CGFloat btnWidth = [UIScreen mainScreen].bounds.size.width / 2;
    self.topCategoryScrollView.showsHorizontalScrollIndicator = NO;
    for (NSInteger i =0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"回复我的" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [btn addTarget:self action:@selector(clickTopCategoryBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = PersonalHomeCommentTypeResponse;
        [self.topCategoryScrollView addSubview:btn];
        btn.frame = CGRectMake(i * btnWidth, 0, btnWidth, self.topCategoryScrollView.frame.size.height);
        [self.categoryBtnArr addObject:btn];
        if (i == 0) {
            btn.selected = YES;
            [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        }
        if (i == 1) {
            [btn setTitle:@"我的评论" forState:UIControlStateNormal];
            btn.tag = PersonalHomeCommentTypeSend;
        }
    }
    CGFloat lineHeight = 1.5;
    
    self.categoryBottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.topCategoryScrollView.frame.size.height - lineHeight, 13, lineHeight)];
    [self.categoryBottomLine setBackgroundColor:[UIColor redColor]];
    [self.topCategoryScrollView addSubview:self.categoryBottomLine];
    self.categoryBottomLine.center = CGPointMake(btnWidth / 2, self.categoryBottomLine.center.y);
    self.topCategoryScrollView.backgroundColor = [UIColor colorWithRed:236.0/255 green:236.0/255 blue:236.0/255 alpha:1];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}

- (void)clickTopCategoryBtn:(UIButton *)sender{
    for (UIButton *btn in self.categoryBtnArr) {
        btn.selected = NO;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    }
    [sender.titleLabel setFont:[UIFont systemFontOfSize:15]];
    sender.selected = YES;
    
    [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect rect = self.categoryBottomLine.frame;
        rect.origin.x = sender.center.x - rect.size.width/2;
        self.categoryBottomLine.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
    self.currentCommentType = sender.tag;
    [self loadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (self.currentCommentType == PersonalHomeCommentTypeSend) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"redCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"greenCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor greenColor];
    }
    return cell;
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
