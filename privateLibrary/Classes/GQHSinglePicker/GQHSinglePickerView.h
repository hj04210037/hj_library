//
//  GQHSinglePickerView.h
//  Seed
//
//  Created by Mac on 2018/12/17.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


/// 选择回调block
typedef void(^GQHSinglePickerViewBlock)(NSInteger index, NSString * _Nullable selectedString);


@interface GQHSinglePickerView : UIView

/// 选择回调
@property (nonatomic, copy) GQHSinglePickerViewBlock _Nullable qh_block;
/// 数据源
@property (nonatomic, strong) NSArray <NSString *> *qh_dataSourceArray;


/// 显示选择视图
- (void)qh_pickerViewShow:(id _Nullable )sender;
/// 隐藏选择视图
- (void)qh_pickerViewDismiss:(id _Nullable )sender;

@end
