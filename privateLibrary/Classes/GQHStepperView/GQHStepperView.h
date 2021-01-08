//
//  GQHStepperView.h
//  Seed
//
//  Created by GuanQinghao on 24/01/2018.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GQHStepperView;
/**
 自定义视图的代理
 */
@protocol GQHStepperViewDelegate <NSObject>

@required

@optional

- (void)qh_stepperView:(GQHStepperView *)stepperView didChangeValue:(NSUInteger)value;

@end


/**
 数量增减视图
 */
@interface GQHStepperView : UIView

/**
 当前值
 */
@property (nonatomic, assign) NSUInteger qh_value;

/**
 最大值 默认99
 */
@property (nonatomic, assign) NSUInteger qh_maxValue;

/**
 最小值 默认1
 */
@property (nonatomic, assign) NSUInteger qh_minValue;

/**
 视图代理
 */
@property (nonatomic, weak) id<GQHStepperViewDelegate> qh_delegate;

/**
 数量增减视图

 @param frame 数量增减视图frame
 @return 数量增减视图
 */
+ (instancetype)qh_stepperViewWithFrame:(CGRect)frame;

@end
