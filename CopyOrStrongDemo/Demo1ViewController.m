//
//  Demo1ViewController.m
//  CopyOrStrongDemo
//
//  Created by bianyixuan on 16/3/21.
//  Copyright © 2016年 jzsec-byx. All rights reserved.
//

#import "Demo1ViewController.h"
#import <UIView+LayoutMethods.h>
@interface Demo1ViewController()

@property (nonatomic,strong) NSString *str1;

@property (nonatomic,strong) NSMutableString *str2;

@property (nonatomic,strong) UILabel *label_str1;

@property (nonatomic,strong) UILabel *label_str2;

@property (nonatomic,strong) UIButton *button_changeStr;

@end

@implementation Demo1ViewController

#pragma mark - life cycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.str1=@"str1";
    self.str2=[NSMutableString stringWithString:@"str2"];
    [self.view addSubview:self.label_str1];
    [self.view addSubview:self.label_str2];
    [self.view addSubview:self.button_changeStr];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
}

-(void)dealloc
{
    [self.label_str2 removeObserver:self forKeyPath:@"text"];

}

#pragma mark - CustomDelegate

#pragma mark - event response

-(void)ActionChange{
    self.str1=self.str2;
    [self.str2 appendString:@"str2追加内容"];
    self.label_str2.text=[NSString stringWithFormat:@"当前Str2的值:%@",_str2];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (object==self.label_str2 && [keyPath isEqualToString:@"text"]) {
        NSLog(@"打印当前str1的值:%@",self.str1);
        self.label_str1.text=[NSString stringWithFormat:@"当前Str2的值:%@",_str1];
    }
}

#pragma mark - private methods

#pragma mark - getters and setters

-(NSString *)title
{
    return @"全部定义为strong的demo演示";
}

-(UILabel *)label_str1
{
    if (_label_str1==nil) {
        _label_str1=[[UILabel alloc] init];
        _label_str1.frame=CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 64);
        _label_str1.text=[NSString stringWithFormat:@"当前Str1的值:%@",_str1];
    }
    return _label_str1;
}

-(UILabel *)label_str2
{
    if (_label_str2==nil) {
        _label_str2=[[UILabel alloc] init];
        _label_str2.frame=CGRectMake(0, self.label_str1.bottom, [UIScreen mainScreen].bounds.size.width, 64);
        _label_str2.text=[NSString stringWithFormat:@"当前Str2的值:%@",_str2];
        [_label_str2 addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _label_str2;
}

-(UIButton *)button_changeStr
{
    if (_button_changeStr==nil) {
        _button_changeStr=[[UIButton alloc ]init];
        _button_changeStr.frame=CGRectMake(0, self.label_str2.bottom+64, [UIScreen mainScreen].bounds.size.width, 64);
        _button_changeStr.backgroundColor=[UIColor brownColor];
        [_button_changeStr setTitle:@"改变当前str2的值" forState:UIControlStateNormal];
        [_button_changeStr addTarget:self action:@selector(ActionChange) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button_changeStr;
}

@end
