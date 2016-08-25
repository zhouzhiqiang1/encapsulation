//
//  GSCustomButton.m
//  TestButton
//
//  Created by Aren on 15/9/15.
//  Copyright (c) 2015年 Aren. All rights reserved.
//

#import "GSCustomButton.h"

@interface GSCustomButton()
@property (strong, nonatomic) UIColor *borderColorForNormal;
@property (strong, nonatomic) UIColor *borderColorForHighLight;
@property (strong, nonatomic) UIColor *borderColorForDisable;
@property (strong, nonatomic) UIColor *borderColorForSelected;
@end

@implementation GSCustomButton

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

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

- (void)commonInit
{
    //    self.layer.masksToBounds = YES;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self updateBorderColor];
}

- (void)setCornerRadius:(NSInteger)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

- (NSInteger)cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(float)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    NSLog(@"setBorderColor");
    [self setBorderColor:borderColor forState:UIControlStateNormal];
    [self setBorderColor:borderColor forState:UIControlStateSelected];
    [self setBorderColor:borderColor forState:UIControlStateHighlighted];
    [self setBorderColor:borderColor forState:UIControlStateDisabled];
}

-(UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor forState:(UIControlState)aState
{
    if (aState == UIControlStateNormal) {
        _borderColorForNormal = borderColor;
    } else if (aState == UIControlStateHighlighted) {
        _borderColorForHighLight = borderColor;
    } else if (aState == UIControlStateDisabled) {
        _borderColorForDisable = borderColor;
    } else if (aState == UIControlStateSelected) {
        _borderColorForSelected = borderColor;
    }
}

- (void)updateBorderColor
{
    if (self.state == UIControlStateNormal) {
        self.layer.borderColor = _borderColorForNormal.CGColor;
    } else if (self.state == UIControlStateHighlighted) {
        self.layer.borderColor = _borderColorForHighLight.CGColor;
    } else if (self.state == UIControlStateDisabled) {
        self.layer.borderColor = _borderColorForDisable.CGColor;
    } else if (self.state == UIControlStateSelected) {
        self.layer.borderColor = _borderColorForSelected.CGColor;
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self updateBorderColor];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self updateBorderColor];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    [self updateBorderColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateBorderColor];
}
@end
