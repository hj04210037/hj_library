//
//  GQHStepperView.m
//  Seed
//
//  Created by GuanQinghao on 24/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "GQHStepperView.h"

@interface GQHStepperView () <UITextFieldDelegate> {
    
    NSUInteger value;
    NSUInteger maxValue;
    NSUInteger minValue;
}

/**
 背景视图
 */
@property (nonatomic, strong) UIView *containerView;

/**
 减按钮
 */
@property (nonatomic, strong) UIButton *leftButton;

/**
 输入框
 */
@property (nonatomic, strong) UITextField *middleTextField;

/**
 加按钮
 */
@property (nonatomic, strong) UIButton *rightButton;

@end

/// 宽高比
static CGFloat const kRatio = 3.5f;

@implementation GQHStepperView

+ (instancetype)qh_stepperViewWithFrame:(CGRect)frame {
    
    return [[self alloc] initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        // 初始值
        maxValue = 99;
        minValue = 1;
        value = minValue;
        
        // 加载视图
        [self addSubview:self.containerView];
        [self.containerView addSubview:self.leftButton];
        [self.containerView addSubview:self.middleTextField];
        [self.containerView addSubview:self.rightButton];
        
        [self resignKeyboard:nil];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat sub_x = 0.0f;
    CGFloat sub_y = 0.0f;
    CGFloat sub_width = 0.0f;
    CGFloat sub_height = 0.0f;
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat padding = 10.0f;
    
    CGFloat ratio = (width - padding) / height;
    
    // 控件按照固定比例充满整个frame
    if (ratio > kRatio) {
        
        //左右居中
        sub_x = 0.5f * (width - kRatio * height + padding) ;
        sub_y = 0.0f;
        sub_width = kRatio * height;
        sub_height = height;
    } else {
        
        //上下居中
        sub_x = 0.0f;
        sub_y = 0.5f * (height - width / kRatio);
        sub_width = width;
        sub_height = width / kRatio;
    }
    
    // 背景视图
    self.containerView.frame = CGRectMake(sub_x, sub_y, sub_width, sub_height);
    self.containerView.layer.cornerRadius = 0.5f * sub_height;
    self.containerView.layer.borderWidth = 0.03f * sub_height;
    
    // 左边减按钮
    self.leftButton.frame = CGRectMake(0.0f, 0.0f, sub_height, sub_height);
    self.leftButton.titleLabel.font = [UIFont systemFontOfSize:(0.6 * sub_height)];
    
    // 中间值输入框
    self.middleTextField.frame = CGRectMake(sub_height, 0.0f, (sub_width - 2 * sub_height), sub_height);
    self.middleTextField.font = [UIFont systemFontOfSize:(0.6 * sub_height)];
    
    // 右边加按钮
    self.rightButton.frame = CGRectMake((sub_width - sub_height), 0.0f, sub_height, sub_height);
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:(0.6 * sub_height)];
}

#pragma mark --PrivateMethod
- (IBAction)minusValue:(id)sender {
    
    [self.middleTextField resignFirstResponder];
    
    value = [self.middleTextField.text integerValue];
    
    if (--value > minValue) {
        
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.rightButton.userInteractionEnabled = YES;
        self.rightButton.backgroundColor = [UIColor whiteColor];
    } else {
        
        value = minValue;
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.leftButton.userInteractionEnabled = NO;
        self.leftButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    if (self.qh_delegate && [self.qh_delegate respondsToSelector:@selector(qh_stepperView:didChangeValue:)]) {
        
        [self.qh_delegate qh_stepperView:self didChangeValue:value];
    }
}

- (IBAction)plusValue:(id)sender {
    
    [self.middleTextField resignFirstResponder];
    
    value = [self.middleTextField.text integerValue];
    
    if (++value < maxValue) {
        
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.leftButton.userInteractionEnabled = YES;
        self.leftButton.backgroundColor = [UIColor whiteColor];
    } else {
        
        value = maxValue;
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.rightButton.userInteractionEnabled = NO;
        self.rightButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    if (self.qh_delegate && [self.qh_delegate respondsToSelector:@selector(qh_stepperView:didChangeValue:)]) {
        
        [self.qh_delegate qh_stepperView:self didChangeValue:value];
    }
}

- (IBAction)resignKeyboard:(id)sender {
    
    [self.middleTextField resignFirstResponder];
    
    value = [self.middleTextField.text integerValue];
    
    if (minValue < value && value < maxValue) {
        
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.leftButton.userInteractionEnabled = YES;
        self.leftButton.backgroundColor = [UIColor whiteColor];
        self.rightButton.userInteractionEnabled = YES;
        self.rightButton.backgroundColor = [UIColor whiteColor];
    } else if (value <= minValue) {
        
        value = minValue;
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.leftButton.userInteractionEnabled = NO;
        self.leftButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.rightButton.userInteractionEnabled = YES;
        self.rightButton.backgroundColor = [UIColor whiteColor];
    } else {
        
        value = maxValue;
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.leftButton.userInteractionEnabled = YES;
        self.leftButton.backgroundColor = [UIColor whiteColor];
        self.rightButton.userInteractionEnabled = NO;
       self.rightButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    if (self.qh_delegate && [self.qh_delegate respondsToSelector:@selector(qh_stepperView:didChangeValue:)]) {

        [self.qh_delegate qh_stepperView:self didChangeValue:value];
    }
}

#pragma mark --Setter
- (void)setQh_value:(NSUInteger)qh_value {
    
    if (minValue < qh_value && qh_value < maxValue) {
        
        value = qh_value;
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.leftButton.userInteractionEnabled = YES;
        self.leftButton.backgroundColor = [UIColor whiteColor];
        self.rightButton.userInteractionEnabled = YES;
        self.rightButton.backgroundColor = [UIColor whiteColor];
    } else if (qh_value <= minValue) {
        
        value = minValue;
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.leftButton.userInteractionEnabled = NO;
        self.leftButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.rightButton.userInteractionEnabled = YES;
        self.rightButton.backgroundColor = [UIColor whiteColor];
    } else {
        
        value = maxValue;
        self.middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        
        self.leftButton.userInteractionEnabled = YES;
        self.leftButton.backgroundColor = [UIColor whiteColor];
        self.rightButton.userInteractionEnabled = NO;
        self.rightButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
}

- (void)setQh_maxValue:(NSUInteger)qh_maxValue {
    
    if (qh_maxValue) {
        
        maxValue = qh_maxValue;
        [self resignKeyboard:nil];
    }
}

- (void)setQh_minValue:(NSUInteger)qh_minValue {
    
    if (qh_minValue) {
        
        minValue = qh_minValue;
        [self resignKeyboard:nil];
    }
}

#pragma mark --Getter
- (UIView *)containerView {
    
    if (!_containerView) {
        
        // 三个控件比例  height = 1:1:1   width = 1:1.5:1
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor whiteColor];
        
        _containerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _containerView.layer.masksToBounds = YES;
    }
    
    return _containerView;
}

- (UIButton *)leftButton {
    
    if (!_leftButton) {
        
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.userInteractionEnabled = NO;
        _leftButton.backgroundColor = [UIColor whiteColor];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_leftButton setTitle:@"-" forState:UIControlStateNormal];
        [_leftButton setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(minusValue:) forControlEvents:UIControlEventTouchUpInside];
        
//        _leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
//        [_leftButton setImage:[UIImage imageNamed:@"stepperview_minus"] forState:UIControlStateNormal];
    }
    
    return _leftButton;
}

- (UITextField *)middleTextField {
    
    if (!_middleTextField) {
        
        _middleTextField = [[UITextField alloc] init];
        _middleTextField.text = [NSString stringWithFormat:@"%lu",value];
        _middleTextField.clearButtonMode = UITextFieldViewModeNever;
        _middleTextField.keyboardType = UIKeyboardTypeNumberPad;
        _middleTextField.textAlignment = NSTextAlignmentCenter;
        _middleTextField.delegate = self;
        
        _middleTextField.layer.borderColor = UIColor.lightGrayColor.CGColor;
        _middleTextField.layer.borderWidth = 0.5f;
        _middleTextField.layer.masksToBounds = YES;
        
        UIToolbar *keyToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 45.0f)];
        keyToolBar.translucent = YES;
        keyToolBar.barStyle = UIBarStyleDefault;
        UIBarButtonItem *spaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *doneBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"done", @"完成") style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard:)];
        [keyToolBar setItems:@[spaceBarButtonItem,doneBarButtonItem]];
        _middleTextField.inputAccessoryView = keyToolBar;
    }
    
    return _middleTextField;
}

- (UIButton *)rightButton {
    
    if (!_rightButton) {
        
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.backgroundColor = [UIColor whiteColor];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_rightButton setTitle:@"+" forState:UIControlStateNormal];
        [_rightButton setTitleColor:UIColor.lightGrayColor forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(plusValue:) forControlEvents:UIControlEventTouchUpInside];
        
//        _rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
//        [_rightButton setImage:[UIImage imageNamed:@"stepperview_plus"] forState:UIControlStateNormal];
    }
    
    return _rightButton;
}

- (NSUInteger)qh_value {
    
    return value;
}

@end
