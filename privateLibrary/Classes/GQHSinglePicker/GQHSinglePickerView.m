//
//  GQHSinglePickerView.m
//  Seed
//
//  Created by Mac on 2018/12/17.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//


#import "GQHSinglePickerView.h"


/// 工具栏高度
static CGFloat const kToolBarHeight = 45.0f;
/// 键盘高度
static CGFloat const kPickerViewHeight = 216.0f;


@interface GQHSinglePickerView () <UIPickerViewDataSource, UIPickerViewDelegate>

/// 选择视图
@property (nonatomic, strong) UIPickerView *pickerView;
/// 工具条
@property (nonatomic, strong) UIView *toolBar;
/// 取消按钮
@property (nonatomic, strong) UIButton *cancelButton;
/// 确定按钮
@property (nonatomic, strong) UIButton *doneButton;
/// 预览
@property (nonatomic, strong) UILabel *previewLabel;
/// 选中的索引
@property (nonatomic, assign) NSInteger selectedIndex;
/// 选中的内容
@property (nonatomic, copy) NSString *selectedString;

@end


@implementation GQHSinglePickerView

/// 显示选择视图
- (void)qh_pickerViewShow:(id)sender {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.center = UIApplication.sharedApplication.keyWindow.center;
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.layer.opacity = 1.0f;
        self.toolBar.frame = CGRectMake(0.0f, self.frame.size.height - kToolBarHeight - kPickerViewHeight, self.frame.size.width, kToolBarHeight);
        self.pickerView.frame = CGRectMake(0.0f, self.frame.size.height - kPickerViewHeight, self.frame.size.width, kPickerViewHeight);
    } completion:nil];
}

/// 隐藏选择视图
- (void)qh_pickerViewDismiss:(id)sender {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.layer.opacity = 0.0f;
        self.toolBar.frame = CGRectMake(0.0f, self.frame.size.height, self.frame.size.width, kToolBarHeight);
        self.pickerView.frame = CGRectMake(0.0f, self.frame.size.height + kToolBarHeight, self.frame.size.width, kPickerViewHeight);
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self loadLocalData];
        [self layoutUserInterface];
    }
    
    return self;
}

#pragma mark --Data
- (void)loadLocalData {
    
}

#pragma mark --View
- (void)layoutUserInterface {
    
    self.bounds = UIScreen.mainScreen.bounds;
    self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.3f];
    self.layer.opaque = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(qh_pickerViewDismiss:)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    
    [self addSubview:self.pickerView];
    [self addSubview:self.toolBar];
    [self.toolBar addSubview:self.cancelButton];
    [self.toolBar addSubview:self.previewLabel];
    [self.toolBar addSubview:self.doneButton];
}

#pragma mark --Delegate
/// 某一行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return 45.0f;
}

/// 选择某一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.selectedIndex = row;
    self.selectedString = self.qh_dataSourceArray[row];
    self.previewLabel.text = self.qh_dataSourceArray[row];
}

/// 某一行视图
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *rowLabel = [[UILabel alloc]init];
    rowLabel.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(pickerView.frame), 30.0f);
    rowLabel.font = [UIFont systemFontOfSize:14.0f];
    rowLabel.text = self.qh_dataSourceArray[row];
    rowLabel.textColor = UIColor.darkTextColor;
    rowLabel.textAlignment = NSTextAlignmentCenter;
    
    return rowLabel;
}

/// 总列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

/// 总行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.qh_dataSourceArray.count;
}

#pragma mark --TargetMethod
/// 确定选择某一行执行回调
- (IBAction)didSelectPickerViewData:(id _Nullable)sender {
    
    if (_qh_block) {
        
        _qh_block(self.selectedIndex, self.selectedString);
    }
    
    [self qh_pickerViewDismiss:sender];
}

#pragma mark --PrivateMethod

#pragma mark --Setter
/// 数据源
- (void)setQh_dataSourceArray:(NSArray *)qh_dataSourceArray {
    
    _qh_dataSourceArray = qh_dataSourceArray;
    self.previewLabel.text = [qh_dataSourceArray firstObject];
    self.selectedString = [qh_dataSourceArray firstObject];
    [self.pickerView reloadAllComponents];
}

#pragma mark --Getter
/// 选择器
- (UIPickerView *)pickerView {
    
    if (!_pickerView) {
        
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.frame = CGRectMake(0.0f, CGRectGetHeight(self.frame) - kPickerViewHeight, CGRectGetWidth(self.frame), kPickerViewHeight);
        _pickerView.backgroundColor = UIColor.whiteColor;
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    
    return _pickerView;
}

/// 工具条
- (UIView *)toolBar {
    
    if (!_toolBar) {
        
        _toolBar = [[UIView alloc] init];
        _toolBar.frame = CGRectMake(0, CGRectGetHeight(self.frame) - kPickerViewHeight - kToolBarHeight, CGRectGetWidth(self.frame), kToolBarHeight);
        _toolBar.backgroundColor = UIColor.whiteColor;
    }
    
    return _toolBar;
}

/// 取消按钮
- (UIButton *)cancelButton {
    
    if (!_cancelButton) {
        
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.frame = CGRectMake(0.0f, 0.0f, kToolBarHeight, kToolBarHeight);
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(qh_pickerViewDismiss:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cancelButton;
}

/// 确定按钮
- (UIButton *)doneButton {
    
    if (!_doneButton) {
        
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.frame = CGRectMake(CGRectGetWidth(self.frame) - kToolBarHeight, 0.0f, kToolBarHeight, kToolBarHeight);
        _doneButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_doneButton setTitle:@"确定" forState:UIControlStateNormal];
        [_doneButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(didSelectPickerViewData:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _doneButton;
}

/// 预览视图
- (UILabel *)previewLabel {
    
    if (!_previewLabel) {
        
        _previewLabel = [[UILabel alloc] init];
        _previewLabel.frame = CGRectMake(kToolBarHeight, 0.0f, CGRectGetWidth(self.frame) - 2 * kToolBarHeight, kToolBarHeight);
        _previewLabel.font = [UIFont systemFontOfSize:16.0f];
        _previewLabel.textColor = UIColor.blackColor;
        _previewLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _previewLabel;
}

@end
