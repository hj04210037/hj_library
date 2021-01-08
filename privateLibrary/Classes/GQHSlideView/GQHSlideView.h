//
//  GQHSlideView.h
//  Seed
//
//  Created by GuanQinghao on 13/12/2017.
//  Copyright © 2017 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GQHSlideView;

/**
 轮播图协议
 */
@protocol GQHSlideViewDelegate <NSObject>

@required

@optional

/**
 点击回调

 @param slideView 轮播图
 @param index 轮播图点击的索引值
 */
- (void)qh_slideView:(GQHSlideView *)slideView didSelectItemAtIndex:(NSInteger)index;

/**
 轮播图滚动回调

 @param slideView 轮播图
 @param index 轮播图轮播的当前索引值
 */
- (void)qh_slideView:(GQHSlideView *)slideView didScrollToIndex:(NSInteger)index;

@end


#pragma mark -

/**
 自定义轮播图
 */
@interface GQHSlideView : UIView

/**
 初始化轮播图

 @param frame 轮播图frame(不能为CGRectZero)
 @param duration 轮播图播放时间间隔
 @return 轮播图
 */
- (instancetype)initWithFrame:(CGRect)frame duration:(NSTimeInterval)duration;

/**
 轮播图代理
 */
@property (nonatomic, weak) id<GQHSlideViewDelegate> qh_delegate;

/**
 轮播图图片数据源(图片对象、图片名称或图片路径)
 */
@property (nonatomic, strong) NSArray *qh_imageArray;// image or imageName or imagePath

/**
 轮播图图片数据源(图片URL、图片URL字符串)
 */
@property (nonatomic, strong) NSArray *qh_imageURLArray;// imageURL or imageURLString

/**
 轮播图文本数据源
 */
@property (nonatomic, strong) NSArray *qh_textArray;

#pragma mark - 轮播属性
/// 是否只显示文本内容
@property (nonatomic, assign) BOOL qh_onlyText;
/// 是否显示分页控件
@property (nonatomic, assign) BOOL qh_showPageControl;
/// 单页是否隐藏分页控件
@property (nonatomic, assign) BOOL qh_hidesForSinglePage;
/// 图片填充模式
@property (nonatomic, assign) UIViewContentMode qh_slideViewContentMode;
/// 轮播滚动方向
@property (nonatomic, assign) UICollectionViewScrollDirection qh_scrollDirection;
/// 轮播图占位图
@property (nonatomic, strong) UIImage *qh_placeholderImage;

/// 当前索引值
@property (nonatomic, assign) NSInteger currentIndex;

#pragma mark - 分页控件属性
/// 分页控件点颜色
@property (nonatomic, strong) UIColor *qh_pageDotColor;
/// 分页控件当前页点颜色
@property (nonatomic, strong) UIColor *qh_currentPageDotColor;

#pragma mark - 文本框属性
/// 轮播图文本框边距
@property (nonatomic, assign) UIEdgeInsets qh_textLabelEdgeInsets;
/// 轮播图文本框文字字体
@property (nonatomic, strong) UIFont *qh_textLabelTextFont;
/// 轮播图文本框文字颜色
@property (nonatomic, strong) UIColor *qh_textLabelTextColor;
/// 轮播图文本框背景色
@property (nonatomic, strong) UIColor *qh_textLabelBackgroundColor;
/// 轮播图文本框文字对齐方式
@property (nonatomic, assign) NSTextAlignment qh_textLabelTextAlignment;

@end
