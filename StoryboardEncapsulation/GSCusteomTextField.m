//
//  GSCusteomTextField.m
//  TestButton
//
//  Created by Aren on 15/9/15.
//  Copyright (c) 2015年 Aren. All rights reserved.
//

#import "GSCusteomTextField.h"

static const NSInteger kTagForLeftIconImageView = 1000001;

@implementation GSCusteomTextField


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    [super drawRect:rect];
//}

- (void)setCornerRadius:(NSInteger)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

- (NSInteger)cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

-(UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    //    NSMutableAttributedString placeholderAttribute = self.attributedPlaceholder;
    //    [placeholderAttribute add]
    //    _placeholderColor = placeholderColor;
    self.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:placeholderColor}];
}

- (UIColor *)placeholderColor{
    return nil;
}

- (void)setLeftViewFrame:(CGRect)leftViewFrame
{
    self.leftViewMode = UITextFieldViewModeAlways;
    _leftViewFrame = leftViewFrame;
    [self updateLeftView];
}

- (void)setTextLeftMargin:(CGFloat)textLeftMargin
{
    _textLeftMargin = textLeftMargin;
    [self updateLeftView];
}

- (void)setLeftIcon:(UIImage *)leftIcon
{
    //    _leftIcon = leftIcon;
    UIImageView *imgView = (UIImageView *)[self.leftView viewWithTag:kTagForLeftIconImageView];
    imgView.image = leftIcon;
}

- (void)updateLeftView
{
    self.leftViewMode = UITextFieldViewModeAlways;
    if (!self.leftView) {
        UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.leftViewFrame.size.width + self.leftViewFrame.origin.x + self.textLeftMargin, self.leftViewFrame.size.height + self.leftViewFrame.origin.y)];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.leftViewFrame];
        imgView.tag = kTagForLeftIconImageView;
        [tempView addSubview:imgView];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        self.leftView = tempView;
    } else {
        self.leftView.frame = CGRectMake(0, 0, self.leftViewFrame.size.width + self.leftViewFrame.origin.x + self.textLeftMargin, self.leftViewFrame.size.height + self.leftViewFrame.origin.y);
    }
}
@end
