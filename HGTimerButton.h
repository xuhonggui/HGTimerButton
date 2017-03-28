//
//  HGTimerButton.h
//  BobBuilder
//
//  Created by apple on 2017/3/27.
//  Copyright © 2017年 dlc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGTimerButton : UIButton

/**
 * 初始时间,默认60s
 */
@property (nonatomic, assign) NSInteger startCount;

/**
 * 禁用格式,&符号为占位符,如:重新获取(&s)
 */
@property (nonatomic, copy) NSString *disabledTitleFormat;

/**
 * 开始倒计时
 */
- (void)start;

@end
