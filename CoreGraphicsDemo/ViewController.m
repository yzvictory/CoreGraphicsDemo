//
//  ViewController.m
//  CoreGraphicsDemo
//
//  Created by yz on 15/11/4.
//  Copyright © 2015年 DeviceOne. All rights reserved.
//

#import "ViewController.h"
#import "CGView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGView *view = [[CGView alloc]initWithFrame:CGRectMake(20, 20, 300, 300)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
