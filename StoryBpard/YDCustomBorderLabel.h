//
//  YDCustomBorderLabel.h
//  yxtk
//
//  Created by Aren on 15/7/30.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSInteger, YDCustomBorderStyle) {
    YDCustomBorderStyleLine = 0,
    YDCustomBorderStyleDash,
};
IB_DESIGNABLE
@interface YDCustomBorderLabel : UILabel
@property (nonatomic) IBInspectable NSInteger cornerRadius;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;
#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSInteger borderStyle;
#else
@property (nonatomic) YDCustomBorderStyle borderStyle;
#endif
@end
