//
//  HGTimerButton.m
//  BobBuilder
//
//  Created by apple on 2017/3/27.
//  Copyright © 2017年 dlc. All rights reserved.
//

#import "HGTimerButton.h"

#import "HWWeakTimer.h"

#define kTimeInterval 1.0
#define kStartCount 60
#define kDisabledTitleFormat @"&s"
#define kSeparatedString @"&"

@interface HGTimerButton ()
{
    NSInteger _count;
}
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) NSString *normalTitle;
@property (nonatomic, copy) NSString *disabledTitle;
@property (nonatomic, strong) UIColor *normalTitleColor;
@property (nonatomic, strong) UIColor *disabledTitleColor;
@property (nonatomic, strong) NSArray *disabledComponents;

@end

@implementation HGTimerButton

#pragma mark - initialize

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
        _normalTitle = [self titleForState:UIControlStateNormal];
        [self initialize];
    }
    return self;
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    
    HGTimerButton *timerButton = [super buttonWithType:buttonType];
    timerButton.disabledTitleColor = [timerButton titleColorForState:UIControlStateDisabled];
    [timerButton initialize];
    return timerButton;
}

#pragma mark - override

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    switch (state) {
        case UIControlStateNormal:
            _normalTitle = title;
            break;
        default:
            break;
    }
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [super setTitleColor:color forState:state];
    switch (state) {
        case UIControlStateNormal:
            _normalTitleColor = color;
            break;
        case UIControlStateDisabled:
            _disabledTitleColor = color;
            break;
        default:
            break;
    }

}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (enabled) {
        [_timer invalidate];
        _timer = nil;
    }
    else {
        _count = _startCount;
    }
}

#pragma mark - setter

- (void)setDisabledTitleFormat:(NSString *)disabledTitleFormat {
    NSAssert([disabledTitleFormat containsString:kSeparatedString], @"disabledTitleFormat is invalid, it should contain string like '&'");
    _disabledTitleFormat = disabledTitleFormat;
    _disabledComponents = [_disabledTitleFormat componentsSeparatedByString:kSeparatedString];
}

#pragma mark - public method

- (void)start {
    
    self.enabled = NO;
    [self initializeTimer];
}

#pragma mark - private method
- (void)initialize {
    
    _startCount = kStartCount;
    _normalTitleColor = [self titleColorForState:UIControlStateNormal];
    _disabledTitle = @"";
    _disabledTitleFormat = kDisabledTitleFormat;
    _disabledComponents = [_disabledTitleFormat componentsSeparatedByString:kSeparatedString];
}

- (void)initializeTimer {
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _timer = [HWWeakTimer scheduledTimerWithTimeInterval:kTimeInterval
                                                  target:self
                                                selector:@selector(countDown)
                                                userInfo:nil
                                                 repeats:YES];
    [_timer fire];
}

- (NSString*)handleDisabledTitleComponents {
    
    NSString *tempString = @"";
    for (int i = 0; i < _disabledComponents.count; i++) {
        tempString = [tempString stringByAppendingString:_disabledComponents[i]];
        if (i == 0) {
            tempString = [tempString stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)_count]];
        }
    }
    return tempString;
}

#pragma mark - timer control method

- (void)countDown {
    
    _count--;
    if (_count == 0) {
        self.enabled = YES;
        [self setTitle:_normalTitle forState:UIControlStateNormal];
        [self setTitleColor:_normalTitleColor forState:UIControlStateNormal];
    }
    else {
        _disabledTitle = [self handleDisabledTitleComponents];
        [self setTitle:_disabledTitle forState:UIControlStateDisabled];
        [self setTitleColor:_disabledTitleColor forState:UIControlStateDisabled];
    }

}

- (void)dealloc {
    if (_timer) {
        [_timer invalidate];
    }
}

@end
