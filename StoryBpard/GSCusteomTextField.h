//
//  GSCusteomTextField.h
//  TestButton
//
//  Created by Aren on 15/9/15.
//  Copyright (c) 2015年 Aren. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface GSCusteomTextField : UITextField
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable NSInteger cornerRadius;

@property (nonatomic, assign) IBInspectable UIColor* placeholderColor;
@property (nonatomic, assign) IBInspectable CGRect leftViewFrame;
@property (nonatomic, assign) IBInspectable UIImage *leftIcon;
@property (assign, nonatomic) IBInspectable CGFloat textLeftMargin;
@end
