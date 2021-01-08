//
//  GQHPCDPickerView.m
//  Seed
//
//  Created by Mac on 2018/12/19.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//


#import "GQHPCDPickerView.h"



/// 工具栏高度
static CGFloat const kPCDPickerViewToolBarHeight = 45.0f;
/// 键盘高度
static CGFloat const kPCDPickerViewHeight = 216.0f;


@interface GQHPCDPickerView () <UIPickerViewDataSource, UIPickerViewDelegate>

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

/// 数据源
@property (nonatomic, strong) NSArray *dataSourceArray;

/// 省数据
@property (nonatomic, strong, nullable) NSMutableArray *provinceArray;
/// 市数据
@property (nonatomic, strong, nullable) NSMutableArray *cityArray;
/// 县区数据
@property (nonatomic, strong, nullable) NSMutableArray *districtArray;

/// 地区编码
@property (nonatomic, strong, nullable)NSString *code;
/// 省名称
@property (nonatomic, strong, nullable)NSString *province;
/// 市名称
@property (nonatomic, strong, nullable)NSString *city;
/// 县区名称
@property (nonatomic, strong, nullable)NSString *district;

@end


@implementation GQHPCDPickerView

- (void)qh_pickerViewShow:(id)sender {
    
    [UIApplication.sharedApplication.keyWindow addSubview:self];
    self.center = UIApplication.sharedApplication.keyWindow.center;
    [UIApplication.sharedApplication.keyWindow  bringSubviewToFront:self];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.layer.opacity = 1.0f;
        self.toolBar.frame = CGRectMake(0.0f, CGRectGetHeight(self.bounds) - kPCDPickerViewToolBarHeight - kPCDPickerViewHeight, CGRectGetWidth(self.bounds), kPCDPickerViewToolBarHeight);
        self.pickerView.frame = CGRectMake(0.0f, CGRectGetHeight(self.bounds) - kPCDPickerViewHeight, CGRectGetWidth(self.bounds), kPCDPickerViewHeight);
    }];
}

- (void)qh_pickerViewDismiss:(id)sender {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.layer.opacity = 0.0f;
        self.toolBar.frame = CGRectMake(0.0f, CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds), kPCDPickerViewToolBarHeight);
        self.pickerView.frame = CGRectMake(0.0f, CGRectGetHeight(self.bounds) + kPCDPickerViewToolBarHeight, CGRectGetWidth(self.bounds), kPCDPickerViewHeight);
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:(CGRect)frame]) {
        
        [self loadLocalData];
        [self layoutUserInterface];
    }
    
    return self;
}

#pragma mark --Data
- (void)loadLocalData {
    
    [self.dataSourceArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.provinceArray addObject:obj];
    }];
    
    NSMutableArray *cities = [NSMutableArray arrayWithArray:[[self.provinceArray firstObject] objectForKey:@"cities"]];
    [cities enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.cityArray addObject:obj];
    }];
    
    NSMutableArray *districts = [NSMutableArray arrayWithArray:[[self.cityArray firstObject] objectForKey:@"districts"]];
    [districts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.districtArray addObject:obj];
    }];
    
    [self reloadSelectAddress];
}

#pragma mark --View
- (void)layoutUserInterface {
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
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
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return 45.0f;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    switch (component) {
        case 0: {
            
            if (row < self.provinceArray.count) {
                
                [self updateCitiesComponent:self.provinceArray[row] Row:row];
            }
        }
            break;
        case 1: {
            if (row < self.cityArray.count) {
                
                [self updateDistrictsComponent:self.cityArray[row] Row:row];
            }
        }
            break;
        case 2: {
            
        }
            break;
        default:
            break;
    }
    
    [self reloadSelectAddress];
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *rowLabel = [[UILabel alloc]init];
    rowLabel.bounds = CGRectMake(0.0f, 0.0f, 0.333f * CGRectGetWidth(pickerView.bounds), 35.0f);
    rowLabel.font = [UIFont systemFontOfSize:14.0f];
    rowLabel.textColor = UIColor.darkTextColor;
    rowLabel.textAlignment = NSTextAlignmentCenter;
    
    NSString *text = @"";
    
    switch (component) {
            
        case 0: {
            
            if (row < self.provinceArray.count) {
                
                text = [self.provinceArray[row] objectForKey:@"name"];
            }
        }
            break;
        case 1: {
            
            if (row < self.cityArray.count) {
                
                text = [self.cityArray[row] objectForKey:@"name"];
            }
        }
            break;
        case 2: {
            
            if (row < self.districtArray.count) {
                
                text = [self.districtArray[row] objectForKey:@"name"];
            }
        }
            break;
            
        default:
            break;
    }
    
    if ([text length] > 0) {
        
        [rowLabel setText:text];
    }
    
    return rowLabel;
}

#pragma mark --UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    switch (component) {
        case 0:
            return self.provinceArray.count;
            break;
        case 1:
            return self.cityArray.count;
            break;
        case 2:
            return self.districtArray.count;
            break;
            
        default:
            return 0;
            break;
    }
}

- (void)updateCitiesComponent:(NSDictionary *)dict Row:(NSInteger)row {
    
    NSMutableArray *cities = [NSMutableArray arrayWithArray:[dict objectForKey:@"cities"]];
    [self.cityArray removeAllObjects];
    [cities enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.cityArray addObject:obj];
    }];
    
    [self.pickerView reloadComponent:1];
    [self.pickerView selectRow:0 inComponent:1 animated:YES];
    
    if (self.cityArray.count > 0) {
        
        [self updateDistrictsComponent:self.cityArray[0] Row:0];
    } else {
        
        [self updateDistrictsComponent:@{@"":@""} Row:0];
        self.city = @"";
    }
}
- (void)updateDistrictsComponent:(NSDictionary *)dict Row:(NSInteger)row {
    
    [self.districtArray removeAllObjects];
    NSMutableArray *districts = [NSMutableArray arrayWithArray:[dict objectForKey:@"districts"]];
    [districts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.districtArray addObject:obj];
    }];
    
    [self.pickerView reloadComponent:2];
    [self.pickerView selectRow:0 inComponent:2 animated:YES];
}

#pragma mark --TargetMethod
- (IBAction)didSelectPickerViewData:(id _Nullable)sender {
    
    if (self.qh_block) {
        
        self.qh_block(self.code, self.province, self.city, self.district);
    }
    
    [self qh_pickerViewDismiss:nil];
}

#pragma mark --PrivateMethod
- (void)reloadSelectAddress {
    
    NSInteger rowComponet0 = [self.pickerView selectedRowInComponent:0];
    NSInteger rowComponet1 = [self.pickerView selectedRowInComponent:1];
    NSInteger rowComponet2 = [self.pickerView selectedRowInComponent:2];
    
    _province = @"";
    _city = @"";
    _district = @"";
    
    if (self.provinceArray.count > 0) {
        
        _province = [self.provinceArray[rowComponet0] objectForKey:@"name"];
    }
    if (self.cityArray.count > 0) {
        
        _city = [self.cityArray[rowComponet1] objectForKey:@"name"];
    }
    if (self.districtArray.count > 0) {
        
        _district = [self.districtArray[rowComponet2] objectForKey:@"name"];
        _code = [self.districtArray[rowComponet2] objectForKey:@"id"];
    }
    
    NSString *address = [NSString stringWithFormat:@"%@%@%@", _province, _city, _district];
    
    [self.previewLabel setText:address];
}

#pragma mark --Setter

#pragma mark --Getter
- (UIPickerView *)pickerView {
    
    if (!_pickerView) {
        
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.frame = CGRectMake(0.0f, CGRectGetHeight(self.bounds) - kPCDPickerViewHeight, CGRectGetWidth(self.bounds), kPCDPickerViewHeight);
        _pickerView.backgroundColor = UIColor.whiteColor;
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    
    return _pickerView;
}

- (UIView *)toolBar {
    
    if (!_toolBar) {
        
        _toolBar = [[UIView alloc] init];
        _toolBar.frame = CGRectMake(0.0f, CGRectGetHeight(self.bounds) - kPCDPickerViewHeight - kPCDPickerViewToolBarHeight, CGRectGetWidth(self.bounds), kPCDPickerViewToolBarHeight);
        _toolBar.backgroundColor = UIColor.whiteColor;
    }
    
    return _toolBar;
}

- (UIButton *)cancelButton {
    
    if (!_cancelButton) {
        
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.frame = CGRectMake(0.0f, 0.0f, kPCDPickerViewToolBarHeight, kPCDPickerViewToolBarHeight);
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(qh_pickerViewDismiss:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cancelButton;
}

- (UIButton *)doneButton {
    
    if (!_doneButton) {
        
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.frame = CGRectMake(CGRectGetWidth(self.bounds) - kPCDPickerViewToolBarHeight, 0, kPCDPickerViewToolBarHeight, kPCDPickerViewToolBarHeight);
        _doneButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_doneButton setTitle:@"确定" forState:UIControlStateNormal];
        [_doneButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(didSelectPickerViewData:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _doneButton;
}

- (UILabel *)previewLabel {
    
    if (!_previewLabel) {
        
        _previewLabel = [[UILabel alloc] init];
        _previewLabel.frame = CGRectMake(kPCDPickerViewToolBarHeight, 0.0f, CGRectGetWidth(self.bounds) - 2 * kPCDPickerViewToolBarHeight, kPCDPickerViewToolBarHeight);
        _previewLabel.font = [UIFont systemFontOfSize:16.0f];
        _previewLabel.textColor = UIColor.blackColor;
        _previewLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _previewLabel;
}

-(NSArray *)dataSourceArray {
    
    if (!_dataSourceArray) {
        
        _dataSourceArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pcd" ofType:@"plist"]];
    }
    
    return _dataSourceArray;
}

- (NSMutableArray *)provinceArray {
    
    if (!_provinceArray) {
        
        _provinceArray = [NSMutableArray array];
    }
    return _provinceArray;
}

- (NSMutableArray *)cityArray {
    
    if (!_cityArray) {
        
        _cityArray = [NSMutableArray array];
    }
    
    return _cityArray;
}

- (NSMutableArray *)districtArray {
    
    if (!_districtArray) {
        
        _districtArray = [NSMutableArray array];
    }
    
    return _districtArray;
}

@end
