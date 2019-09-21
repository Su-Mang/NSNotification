//
//  OneViewController.m
//  通知传值
//
//  Created by 岳靖翔 on 2019/9/18.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
@interface OneViewController ()

@end

@implementation OneViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(recive:) name:@"send" object:nil];
}
-(void)recive:(NSNotification*)noti
{
    NSLog(@"通知");
    sleep(3);
    NSDictionary*dic = noti.userInfo;
    _uiTextField.text = dic[@"input"];
    NSLog(@"请看打印时间,就可以知道同步还是异步");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _uiTextField = [[UITextField alloc]initWithFrame:CGRectMake(100, 50, 300, 50)];
    [self.view addSubview:_uiTextField];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    TwoViewController *two = [[TwoViewController alloc]init];
    [self presentViewController:two animated:YES completion:nil];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
