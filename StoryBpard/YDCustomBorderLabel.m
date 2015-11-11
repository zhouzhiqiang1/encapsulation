//
//  YDCustomBorderLabel.m
//  yxtk
//
//  Created by Aren on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "YDCustomBorderLabel.h"

@interface YDCustomBorderLabel()

@end
@implementation YDCustomBorderLabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//     Drawing code
    [super drawRect:rect];
    
    CGRect bounds = self.bounds;
    bounds.origin.x = self.borderWidth;
    bounds.origin.y = self.borderWidth;
    bounds.size.height -= self.borderWidth*2;
    bounds.size.width -= self.borderWidth*2;
    
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:self.cornerRadius];
    [self.borderColor setStroke];
    borderPath.lineWidth = self.borderWidth;
    CGFloat dashPattern[] = {4, 2};
    if (self.borderStyle == YDCustomBorderStyleDash) {
        [borderPath setLineDash:dashPattern count:2 phase:0];
    } else {
        [borderPath setLineDash:NULL count:0 phase:0];
    }
    [borderPath stroke];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initBorder];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initBorder];
    }
    return self;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    if (_borderColor!=borderColor) {
        _borderColor = borderColor;
//        [self setNeedsDisplay];
    }
}

- (void)setBorderStyle:(YDCustomBorderStyle)borderStyle
{
    if (_borderStyle!=borderStyle) {
        _borderStyle = borderStyle;
//        [self setNeedsDisplay];
    }
}

- (void)initBorder
{
    _borderColor = [UIColor blackColor];
    _borderWidth = 1;
    _borderStyle = YDCustomBorderStyleLine;
}

@end
