//
//  TwoViewController.m
//  通知传值
//
//  Created by 岳靖翔 on 2019/9/18.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _uiTextField = [[UITextField alloc]initWithFrame:CGRectMake(100, 50, 300, 50)];
    [self.view addSubview:_uiTextField];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 30, 30)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}
-(void)click
{
    //创建通知
    NSNotification *notic = [NSNotification notificationWithName:@"send" object:self userInfo:@{@"input":_uiTextField.text}];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter]postNotification:notic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
