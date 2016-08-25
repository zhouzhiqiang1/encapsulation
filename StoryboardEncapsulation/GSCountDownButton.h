//
//  GSCountDownButton.h
//  GlassStore
//
//  Created by noname on 15/1/26.
//  Copyright (c) 2015年 ORead. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSCustomButton.h"

@interface GSCountDownButton : GSCustomButton
@property (nonatomic, assign) NSInteger countDownDuration;
/**
 *  收集号码出错返回初始化状态
 */
- (void)reset;
-(void)startCountDown;
@end
