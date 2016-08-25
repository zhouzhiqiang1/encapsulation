//
//  GSCustomButton.h
//  TestButton
//
//  Created by Aren on 15/9/15.
//  Copyright (c) 2015年 Aren. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface GSCustomButton : UIButton
@property (assign, nonatomic) IBInspectable float borderWidth;
@property (assign, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable NSInteger cornerRadius;

- (void)commonInit;
- (void)setBorderColor:(UIColor *)borderColor forState:(UIControlState)aState;
@end
