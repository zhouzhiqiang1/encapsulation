//
//  GSCountDownButton.m
//  GlassStore
//
//  Created by noname on 15/1/26.
//  Copyright (c) 2015年 ORead. All rights reserved.
//

#import "GSCountDownButton.h"

@interface GSCountDownButton()
{
    NSInteger remainTime;
}

@property (nonatomic, strong) NSTimer *countDownTimer;
@property (nonatomic, strong) NSString *defaultTitle;

@end

@implementation GSCountDownButton

- (void)commonInit
{
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

-(void)dealloc
{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.defaultTitle = self.titleLabel.text;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
}

-(void)startCountDown
{
    [self cancelTimer];
    self.defaultTitle = self.titleLabel.text;
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    remainTime = self.countDownDuration;
}

-(void)cancelTimer
{
    if (self.countDownTimer) {
        [self.countDownTimer invalidate];
        [self setCountDownTimer:nil];
    }
}

-(void)onTimer
{
    remainTime -= 1;
    if (remainTime <= 0) {
        [self cancelTimer];
        self.enabled = YES;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setTitle:@"重发" forState:UIControlStateNormal];
            [self setTitle:@"重发" forState:UIControlStateHighlighted];
            [self setTitle:@"重发" forState:UIControlStateDisabled];
        });
        
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setTitle:[NSString stringWithFormat:@"%ld秒后重发", (long)remainTime] forState:UIControlStateNormal];
            [self setTitle:[NSString stringWithFormat:@"%ld秒后重发", (long)remainTime] forState:UIControlStateHighlighted];
            [self setTitle:[NSString stringWithFormat:@"%ld秒后重发", (long)remainTime] forState:UIControlStateDisabled];
        });
        
    }
}

- (void)reset
{
    [self cancelTimer];
    self.enabled = NO;
    [self setTitle:self.defaultTitle forState:UIControlStateNormal];
    [self setTitle:self.defaultTitle forState:UIControlStateHighlighted];
    [self setTitle:self.defaultTitle forState:UIControlStateDisabled];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    self.enabled = NO;
    [self startCountDown];
}
@end
