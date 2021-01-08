//
//  GQHPCDPickerView.h
//  Seed
//
//  Created by Mac on 2018/12/19.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


/// 选择回调block
typedef void(^SelectPCDBlock)(NSString * _Nullable code, NSString * _Nullable province, NSString * _Nullable city, NSString * _Nullable district);

@interface GQHPCDPickerView : UIView

/// 选择回调
@property (nonatomic, copy) SelectPCDBlock _Nullable qh_block;

/// 显示地址选择视图
- (void)qh_pickerViewShow:(id _Nullable )sender;
/// 隐藏地址选择视图
- (void)qh_pickerViewDismiss:(id _Nullable )sender;

@end
