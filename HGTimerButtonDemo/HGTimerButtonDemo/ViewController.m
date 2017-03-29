//
//  ViewController.m
//  HGTimerButtonDemo
//
//  Created by apple on 2017/3/29.
//  Copyright © 2017年 xuhonggui. All rights reserved.
//

#import "ViewController.h"
#import "HGTimerButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HGTimerButton *xibTimerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialize];
}

- (void)initialize {
    
    HGTimerButton *timerButton = [HGTimerButton buttonWithType:UIButtonTypeCustom];
    timerButton.frame = CGRectMake(40, CGRectGetHeight(self.view.frame)/2 - 50, CGRectGetWidth(self.view.frame) - 80, 40);
    timerButton.layer.borderWidth = 0.5;
    timerButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    timerButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [timerButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [timerButton setTitleColor:[UIColor colorWithRed:0/255.0 green:174.0/255.0 blue:235.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [timerButton setDisabledTitleFormat:@"重新获取(&s)"];
    [timerButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [timerButton addTarget:self action:@selector(timerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:timerButton];

}

- (IBAction)timerButtonClick:(HGTimerButton *)sender {
    [sender start];
}

@end
