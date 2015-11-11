//
//  ViewController.m
//  StoryBpard
//
//  Created by r_zhou on 15/11/10.
//  Copyright © 2015年 r_zhou. All rights reserved.
//

#import "ViewController.h"
#import "GSCountDownButton.h"
#import "UIColor+UIColor_Hex.h"
#import "GSPasswordInputView.h"

@interface ViewController ()<GSPasswordInputViewDelegate>
@property (weak, nonatomic) IBOutlet GSCountDownButton *validationBtn;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet GSPasswordInputView *payPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置验证码边框和边框颜色

    self.validationBtn.countDownDuration = 180;//传人倒计时时间
    self.validationBtn.borderWidth = 1;
    [self.validationBtn setBorderColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.validationBtn setBorderColor:[UIColor redColor] forState:UIControlStateDisabled];
    [self.validationBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.validationBtn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
    
    //支付密码框
    self.payPassword.numberOfDigit = 6;
    self.payPassword.fontSize = 40;
    self.payPassword.delegate = self;
    [self.payPassword.inputTextField becomeFirstResponder];
    
    
    

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20,self.view.frame.size.height - 230, 300, 50)];
    label.text = @"Hello world! Hello world!Hello world! Hello world! Hello world!";
    //背景颜色为红色
    label.backgroundColor = [UIColor redColor];
    //设置字体颜色为白色
    label.textColor = [UIColor whiteColor];
    //文字居中显示
    label.textAlignment = NSTextAlignmentCenter;
    //自动折行设置
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.numberOfLines = 0;
    [self.view addSubview:label];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- Action
- (IBAction)validationBtnCLick:(id)sender {
       [self.validationBtn reset];
    NSLog(@"验证");
}

- (IBAction)backgroundBtnClick:(id)sender {
    NSLog(@"更换背景色");
    if (self.textField.text.length == 6) {
        self.view.backgroundColor = [UIColor colorWithHexString:self.textField.text];
    } else {
        self.textField.text = nil;
        self.textField.placeholder = @"请输入六个字符";
    }
    
}

#pragma mark -- GSPasswordInputViewDelegate
- (void)didFinishEditingWithInputView:(GSPasswordInputView *)anInputView text:(NSString *)aText
{
    NSLog(@"%@",aText);
}


@end
