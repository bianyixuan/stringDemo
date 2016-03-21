//
//  ViewController.m
//  CopyOrStrongDemo
//
//  Created by bianyixuan on 16/3/21.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "ViewController.h"
#import <UIView+LayoutMethods.h>
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
@interface ViewController ()

@property (nonatomic,strong) UIButton *buton_demo1; //demo1 ，两个字符串都定义为strong

@property (nonatomic,strong) UIButton *buton_demo2; //demo2 ，两个字符串分别为copy和strong

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.buton_demo1];
    [self.view addSubview:self.buton_demo2];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor=[UIColor whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CustomDelegate

#pragma mark - event response

-(void)ActionForDemo1{
    Demo1ViewController *demo1VC=[[Demo1ViewController alloc] init];
    [self.navigationController pushViewController:demo1VC animated:YES];
}

-(void)ActionForDemo2{
    Demo2ViewController *demo2VC=[[Demo2ViewController alloc] init];
    [self.navigationController pushViewController:demo2VC animated:YES];
}

#pragma mark - private methods

#pragma mark - getters and setters

-(NSString *)title
{
    return @"Demo演示";
}

-(UIButton *)buton_demo1
{
    if (_buton_demo1==nil) {
        _buton_demo1=[[UIButton alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 64)];
        _buton_demo1.backgroundColor=[UIColor blueColor];
        _buton_demo1.titleLabel.font=[UIFont systemFontOfSize:15.f];
        [_buton_demo1 addTarget:self action:@selector(ActionForDemo1) forControlEvents:UIControlEventTouchUpInside];
        [_buton_demo1 setTitle:@"两个字符串全部定义为strong效果演示" forState:UIControlStateNormal];
    }
    return _buton_demo1;
}

-(UIButton *)buton_demo2
{
    if (_buton_demo2==nil) {
        _buton_demo2=[[UIButton alloc] initWithFrame:CGRectMake(0,self.buton_demo1.bottom, [UIScreen mainScreen].bounds.size.width, 64)];
        _buton_demo2.backgroundColor=[UIColor grayColor];
        _buton_demo2.titleLabel.font=[UIFont systemFontOfSize:15.f];
        [_buton_demo2 addTarget:self action:@selector(ActionForDemo2) forControlEvents:UIControlEventTouchUpInside];
        [_buton_demo2 setTitle:@"两个字符串分别定义为copy和strong的效果演示" forState:UIControlStateNormal];

    }
    return _buton_demo2;
}

@end
