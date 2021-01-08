//
//  GQHSlideView.m
//  Seed
//
//  Created by GuanQinghao on 13/12/2017.
//  Copyright © 2017 GuanQinghao. All rights reserved.
//

#import "GQHSlideView.h"
#import "GQHMultimediaView.h"


#pragma mark -
#pragma mark - 自定义轮播图
#pragma mark -

@interface GQHSlideView () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

/// 容器视图
@property (nonatomic, strong) UIScrollView *containerView;
/// 分页控件
@property (nonatomic, strong) UIPageControl *pageControl;

/// 左文本框
@property (nonatomic, strong) UILabel *leftTextLabel;
/// 中文本框
@property (nonatomic, strong) UILabel *centerTextLabel;
/// 右文本框
@property (nonatomic, strong) UILabel *rightTextLabel;

/// 左图片框
@property (nonatomic, strong) GQHMultimediaView *leftImageView;
/// 中图片框
@property (nonatomic, strong) GQHMultimediaView *centerImageView;
/// 右图片框
@property (nonatomic, strong) GQHMultimediaView *rightImageView;

/// 内部数据源
@property (nonatomic, strong) NSArray *dataSourceArray;



/// 自动轮播时间间隔
@property (nonatomic, assign) CGFloat duration;
/// 定时器
@property (nonatomic, strong) NSTimer *timer;

@end

/// 滚动的临界值
static CGFloat const kCriticalValue = 0.2f;

@implementation GQHSlideView

#pragma mark -
/// 释放
- (void)dealloc {
    
    // 移除观察者
    [self removeObserver];
    
    if (self.timer) {
        
        [self.timer invalidate];
        self.timer = nil;
    }
}

/// 初始化
- (instancetype)initWithFrame:(CGRect)frame duration:(NSTimeInterval)duration {
    
    if (self = [super initWithFrame:frame]) {
        
        // 默认值
        [self setupDefault];
        
        // 定时器
        if (duration > 0.0f) {
            
            self.duration = duration;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(timerDidFired:) userInfo:nil repeats:YES];
            [self.timer setFireDate:[NSDate distantFuture]];
        }
        
        // 加载视图
        [self loadUserInterface];
        // 添加观察者
        [self addObserver];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        // 默认值
        [self setupDefault];
        // 定时器
        self.duration = 0.0f;
        // 加载视图
        [self loadUserInterface];
        // 添加观察者
        [self addObserver];
    }
    
    return self;
}

/// 设置默认值
- (void)setupDefault {
    
    // 轮播图属性
    _qh_onlyText = NO;
    _qh_showPageControl = YES;
    _qh_hidesForSinglePage = YES;
    _qh_slideViewContentMode = UIViewContentModeScaleAspectFit;
    _qh_scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    /// 分页控件属性
    _qh_pageDotColor = UIColor.lightGrayColor;
    _qh_currentPageDotColor = UIColor.whiteColor;
    
    // 文本框默认属性
    _qh_textLabelEdgeInsets = UIEdgeInsetsMake(0.5f * CGRectGetHeight(self.bounds),0.5f * CGRectGetWidth(self.bounds), 0.5f * CGRectGetHeight(self.bounds), 0.5f * CGRectGetWidth(self.bounds));
    _qh_textLabelTextFont = [UIFont systemFontOfSize:16.0f];
    _qh_textLabelTextColor = UIColor.whiteColor;
    _qh_textLabelBackgroundColor = UIColor.groupTableViewBackgroundColor;
    _qh_textLabelTextAlignment = NSTextAlignmentLeft;
}

#pragma mark - View
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self loadUserInterface];
}

/// 加载视图
- (void)loadUserInterface {
    
    // 图片框上添加文本框
    [self.leftImageView addSubview:self.leftTextLabel];
    [self.centerImageView addSubview:self.centerTextLabel];
    [self.rightImageView addSubview:self.rightTextLabel];
    
    // 容器视图上添加图片框
    [self.containerView addSubview:self.leftImageView];
    [self.containerView addSubview:self.centerImageView];
    [self.containerView addSubview:self.rightImageView];
    
    // 添加容器视图和分页控件
    [self addSubview:self.containerView];
    [self addSubview:self.pageControl];
    
    // 容器视图的frame
    self.containerView.frame = self.bounds;
    
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    
    // 图片框的frame
    switch (self.qh_scrollDirection) {
            
        case UICollectionViewScrollDirectionHorizontal: {
            // 水平滚动
            self.leftImageView.frame = CGRectMake(0.0f, 0.0f, width, height);
            self.centerImageView.frame = CGRectMake(width, 0.0f, width, height);
            self.rightImageView.frame = CGRectMake(2 * width, 0.0f, width, height);
            
            self.containerView.contentSize = CGSizeMake(3 * width, height);
        }
            break;
        case UICollectionViewScrollDirectionVertical: {
            // 垂向滚动
            self.leftImageView.frame = CGRectMake(0.0f, 0.0f, width, height);
            self.centerImageView.frame = CGRectMake(0.0f, height, width, height);
            self.rightImageView.frame = CGRectMake(0.0f, 2 * height, width, height);
            
            self.containerView.contentSize = CGSizeMake(width, 3 * height);
        }
            break;
    }
    
    // 文本框属性
    CGFloat top = self.qh_textLabelEdgeInsets.top;
    CGFloat left = self.qh_textLabelEdgeInsets.left;
    CGFloat bottom = self.qh_textLabelEdgeInsets.bottom;
    CGFloat right = self.qh_textLabelEdgeInsets.right;
    self.leftTextLabel.frame = self.centerTextLabel.frame = self.rightTextLabel.frame = CGRectMake(left, top, width - left - right, height - top - bottom);
    self.leftTextLabel.font = self.centerTextLabel.font = self.rightTextLabel.font = _qh_textLabelTextFont;
    self.leftTextLabel.textColor = self.centerTextLabel.textColor = self.rightTextLabel.textColor = _qh_textLabelTextColor;
    self.leftTextLabel.textAlignment = self.centerTextLabel.textAlignment = self.rightTextLabel.textAlignment = _qh_textLabelTextAlignment;
    self.leftTextLabel.backgroundColor = self.centerTextLabel.backgroundColor = self.rightTextLabel.backgroundColor = _qh_textLabelBackgroundColor;
    
    // 分页控件frame
    self.pageControl.frame = CGRectMake(0.0f, height - 30.0f, width, 30.0f);
    
    // 设置contentOffset偏移量
    [self setScrollViewContentOffset];
}

#pragma mark - KVO
/// 添加观察者
- (void)addObserver {
    
    [self.containerView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

/// 移除观察者
- (void)removeObserver {
    
    [self.containerView removeObserver:self forKeyPath:@"contentOffset"];
}

/// 监听键值变化
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        // 计算当前索引
        [self caculateCurrentIndex];
    }
}

#pragma mark - UIScrollViewDelegate
/// 容器视图将要开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (self.dataSourceArray && self.dataSourceArray.count > 1) {
        
        // 暂停计时
        [self.timer setFireDate:[NSDate distantFuture]];
    }
}

/// 容器视图已结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (self.dataSourceArray && self.dataSourceArray.count > 1) {
        
        // 开始计时
        [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:self.duration]];
    }
}

#pragma mark - TargetMethod
/// 点击当前轮播图
- (IBAction)clickedSlideView:(UITapGestureRecognizer *)sender {
    
    if (self.qh_delegate && [self.qh_delegate respondsToSelector:@selector(qh_slideView:didSelectItemAtIndex:)]) {
        
        // 点击回调
        [self.qh_delegate qh_slideView:self didSelectItemAtIndex:self.currentIndex];
    }
}

/// 启动定时器，开始自动轮播
- (IBAction)timerDidFired:(id)sender {
    
    switch (self.qh_scrollDirection) {
            
        case UICollectionViewScrollDirectionHorizontal: {
            
            // 水平滚动
            if (self.containerView.contentOffset.x < CGRectGetWidth(self.containerView.bounds) - kCriticalValue || self.containerView.contentOffset.x > CGRectGetWidth(self.containerView.bounds) + kCriticalValue) {
                
                // 设置contentOffset偏移量
                [self setScrollViewContentOffset];
            }
            
            CGPoint offset = CGPointMake(self.containerView.contentOffset.x + CGRectGetWidth(self.containerView.bounds), self.containerView.contentOffset.y);
            [self.containerView setContentOffset:offset animated:YES];
        }
            break;
            
        case UICollectionViewScrollDirectionVertical: {
            
            // 垂向滚动
            if (self.containerView.contentOffset.y < CGRectGetHeight(self.containerView.bounds) - kCriticalValue || self.containerView.contentOffset.y > CGRectGetWidth(self.containerView.bounds) + kCriticalValue) {
                
                // 设置contentOffset偏移量
                [self setScrollViewContentOffset];
            }
            
            CGPoint offset = CGPointMake(self.containerView.contentOffset.x, self.containerView.contentOffset.y + CGRectGetHeight(self.containerView.bounds));
            [self.containerView setContentOffset:offset animated:YES];
        }
            break;
    }
}

#pragma mark - PrivateMethod
/// 计算当前索引值
- (void)caculateCurrentIndex {
    
    if (self.dataSourceArray && self.dataSourceArray.count > 0) {
        
        CGFloat pointX = self.containerView.contentOffset.x;
        CGFloat pointY = self.containerView.contentOffset.y;
        
        switch (self.qh_scrollDirection) {
                
            case UICollectionViewScrollDirectionHorizontal: {
                
                // 水平滚动
                if (pointX > 2 * CGRectGetWidth(self.containerView.bounds) - kCriticalValue) {
                    
                    // 向左滚动
                    self.currentIndex = (self.currentIndex + 1) % self.dataSourceArray.count;
                } else if (pointX < kCriticalValue) {
                    
                    // 向右滚动
                    self.currentIndex = (self.currentIndex + self.dataSourceArray.count - 1) % self.dataSourceArray.count;
                }
            }
                break;
                
            case UICollectionViewScrollDirectionVertical: {
                
                // 垂向滚动
                if (pointY > (2 * CGRectGetHeight(self.containerView.bounds) - kCriticalValue)) {
                    
                    // 向上滚动
                    self.currentIndex = (self.currentIndex + 1) % self.dataSourceArray.count;
                } else if (pointY < kCriticalValue) {
                    
                    // 向下滚动
                    self.currentIndex = (self.currentIndex + self.dataSourceArray.count - 1) % self.dataSourceArray.count;
                }
            }
                break;
        }
    }
}

/// 设置偏移量
- (void)setScrollViewContentOffset {
    
    switch (self.qh_scrollDirection) {
            
        case UICollectionViewScrollDirectionHorizontal: {
            
            self.containerView.contentOffset = CGPointMake(CGRectGetWidth(self.containerView.bounds), 0.0f);
        }
            break;
            
        case UICollectionViewScrollDirectionVertical: {
            
            self.containerView.contentOffset = CGPointMake(0.0f, CGRectGetHeight(self.containerView.bounds));
        }
            break;
    }
    
    if (self.qh_delegate && [self.qh_delegate respondsToSelector:@selector(qh_slideView:didScrollToIndex:)]) {
        
        // 滚动回调
        [self.qh_delegate qh_slideView:self didScrollToIndex:self.currentIndex];
    }
}

#pragma mark - Setter
/// 数据源
- (void)setQh_imageArray:(NSArray *)qh_imageArray {
    
    // image or imageName or imagePath
    _qh_imageArray = qh_imageArray;
    
    self.dataSourceArray = [NSArray arrayWithArray:qh_imageArray];
}

- (void)setQh_imageURLArray:(NSArray *)qh_imageURLArray {
    
    // imageURL or imageURLString
    _qh_imageURLArray = qh_imageURLArray;
    
    NSMutableArray *temp = [NSMutableArray array];
    [_qh_imageURLArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *URLString;
        if ([obj isKindOfClass:[NSString class]]) {
            
            URLString = obj;
        } else if ([obj isKindOfClass:[NSURL class]]){
            
            URLString = [obj absoluteString];
        } else {
            
            NSLog(@"obj exception! -- %s -- %d", __FUNCTION__, __LINE__);
        }
        
        if (URLString) {
            
            [temp addObject:URLString];
        }
    }];
    
    self.dataSourceArray = [NSArray arrayWithArray:temp];
}

- (void)setQh_textArray:(NSArray *)qh_textArray {
    
    _qh_textArray = qh_textArray;
    
    // 获取数据源
    if (self.qh_onlyText) {
        
        self.dataSourceArray = [NSArray arrayWithArray:self.qh_textArray];
    }
    
    if (qh_textArray && qh_textArray.count > 0) {
        
        // 首次加载显示文本内容
        self.centerTextLabel.text = qh_textArray[self.currentIndex];
    }
}

#pragma mark 轮播属性
/// 是否只显示文本内容
- (void)setQh_onlyText:(BOOL)qh_onlyText {
    
    _qh_onlyText = qh_onlyText;
    
    if (qh_onlyText) {
        
        // 获取文本数据源
        self.dataSourceArray = [NSArray arrayWithArray:self.qh_textArray];
        
        // 只显示文本，图片框设置默认占位图
        self.leftImageView.image = self.centerImageView.image = self.rightImageView.image = self.qh_placeholderImage;
    }
}

/// 是否显示分页控件
- (void)setQh_showPageControl:(BOOL)qh_showPageControl {
    
    _qh_showPageControl = qh_showPageControl;
    
    self.pageControl.hidden = !qh_showPageControl;
}

/// 单页是否隐藏分页控件
- (void)setQh_hidesForSinglePage:(BOOL)qh_hidesForSinglePage {
    
    _qh_hidesForSinglePage = qh_hidesForSinglePage;
    
    if (self.dataSourceArray && 1 == self.dataSourceArray.count && qh_hidesForSinglePage) {
        
        self.pageControl.hidden = qh_hidesForSinglePage;
    } else {
        
        self.pageControl.hidden = !qh_hidesForSinglePage;
    }
}

/// 图片填充模式
- (void)setQh_slideViewContentMode:(UIViewContentMode)qh_slideViewContentMode {
    
    self.leftImageView.contentMode = self.centerImageView.contentMode = self.rightImageView.contentMode = qh_slideViewContentMode;
}

/// 轮播滚动方向
- (void)setQh_scrollDirection:(UICollectionViewScrollDirection)qh_scrollDirection {
    
    _qh_scrollDirection = qh_scrollDirection;
    
    // 重新布局
    [self loadUserInterface];
}

/// 轮播图占位图
- (void)setQh_placeholderImage:(UIImage *)qh_placeholderImage {
    
    _qh_placeholderImage = qh_placeholderImage;
    
    if (self.qh_onlyText) {
        
        // 只显示文本，图片框设置默认占位图
        self.leftImageView.image = self.centerImageView.image = self.rightImageView.image = qh_placeholderImage;
    }
}

#pragma mark 分页控件属性
/// 分页控件点颜色
- (void)setQh_pageDotColor:(UIColor *)qh_pageDotColor {
    
    _qh_pageDotColor = qh_pageDotColor;
    self.pageControl.pageIndicatorTintColor = qh_pageDotColor;
}

/// 分页控件当前页点颜色
- (void)setQh_currentPageDotColor:(UIColor *)qh_currentPageDotColor {
    
    _qh_currentPageDotColor = qh_currentPageDotColor;
    self.pageControl.currentPageIndicatorTintColor = qh_currentPageDotColor;
}

#pragma mark 文本框属性
/// 轮播图文本框边距
- (void)setQh_textLabelEdgeInsets:(UIEdgeInsets)qh_textLabelEdgeInsets {
    
    _qh_textLabelEdgeInsets = qh_textLabelEdgeInsets;
    
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    
    CGFloat top = qh_textLabelEdgeInsets.top;
    CGFloat left = qh_textLabelEdgeInsets.left;
    CGFloat bottom = qh_textLabelEdgeInsets.bottom;
    CGFloat right = qh_textLabelEdgeInsets.right;
    
    self.leftTextLabel.frame = self.centerTextLabel.frame = self.rightTextLabel.frame = CGRectMake(left, top, width - left - right, height - top - bottom);
}

/// 轮播图文本框文字字体
- (void)setQh_textLabelTextFont:(UIFont *)qh_textLabelTextFont {
    
    _qh_textLabelTextFont = qh_textLabelTextFont;
    
    self.leftTextLabel.font = self.centerTextLabel.font = self.rightTextLabel.font = qh_textLabelTextFont;
}

/// 轮播图文本框文字颜色
- (void)setQh_textLabelTextColor:(UIColor *)qh_textLabelTextColor {
    
    _qh_textLabelTextColor = qh_textLabelTextColor;
    
    self.leftTextLabel.textColor = self.centerTextLabel.textColor = self.rightTextLabel.textColor = qh_textLabelTextColor;
}

/// 轮播图文本框背景色
- (void)setQh_textLabelBackgroundColor:(UIColor *)qh_textLabelBackgroundColor {
    
    _qh_textLabelBackgroundColor = qh_textLabelBackgroundColor;
    
    self.leftTextLabel.backgroundColor = self.centerTextLabel.backgroundColor = self.rightTextLabel.backgroundColor = qh_textLabelBackgroundColor;
}

/// 轮播图文本框文字对齐方式
- (void)setQh_textLabelTextAlignment:(NSTextAlignment)qh_textLabelTextAlignment {
    
    _qh_textLabelTextAlignment = qh_textLabelTextAlignment;
    
    self.leftTextLabel.textAlignment = self.centerTextLabel.textAlignment = self.rightTextLabel.textAlignment = qh_textLabelTextAlignment;
}

/// 设置内部数据源
- (void)setDataSourceArray:(NSArray *)dataSourceArray {
    
    _dataSourceArray = dataSourceArray;
    
    // 当前页
    self.currentIndex = 0;
    
    // 开始计时
    [self.timer setFireDate: [NSDate dateWithTimeIntervalSinceNow:self.duration]];
    
    // 设置分页控件
    self.pageControl.numberOfPages = dataSourceArray.count;
    self.pageControl.currentPage = 0;
    self.pageControl.hidden = !self.qh_showPageControl;
}

/// 当前索引值
- (void)setCurrentIndex:(NSInteger)currentIndex {
    
    /**
     1、只显示文本:数据源为文本数组，不显示图片数组，背景图为默认占位图
     2、图文:数据源为图片数组，并且文本数组也要存在且图片数组和文字数组个数相同，如果不同只显示第一个
     3、只显示图片:数据源为图片数组，文本数组不传即可，如果传了就会显示
     */
    
    _currentIndex = currentIndex;
    
    if (self.dataSourceArray && self.dataSourceArray.count > 0) {
        
        NSInteger count = self.dataSourceArray.count;
        NSInteger leftIndex = (currentIndex + count - 1) % count;
        NSInteger rightIndex = (currentIndex + 1) % count;
        
        if (self.qh_onlyText) {
            
            // 只显示文本
            self.leftTextLabel.text = self.dataSourceArray[leftIndex];
            self.centerTextLabel.text = self.dataSourceArray[currentIndex];
            self.rightTextLabel.text = self.dataSourceArray[rightIndex];
        } else {
            
            // 左多媒体视图
            NSString *leftImagePath = self.dataSourceArray[leftIndex];
            self.leftImageView.qh_URLString = leftImagePath;
            
            // 多媒体视图
            NSString *centerImagePath = self.dataSourceArray[currentIndex];
            self.centerImageView.qh_URLString = centerImagePath;
            
            // 右媒体视图
            NSString *rightImagePath = self.dataSourceArray[rightIndex];
            self.rightImageView.qh_URLString = rightImagePath;
            
            
            /**
            if ([leftImagePath isKindOfClass:[NSString class]]) {
                
                
                
                if ([leftImagePath hasPrefix:@"http"]) {
                    
                    //                [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:leftImagePath]];
                    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:leftImagePath] placeholderImage:self.qh_placeholderImage];
                } else {
                    
                    UIImage *image = [UIImage imageNamed:leftImagePath];
                    if (!image) {
                        
                        image = [UIImage imageWithContentsOfFile:leftImagePath];
                    }
                    self.leftImageView.image = image;
                }
            } else if (!self.qh_onlyText && [leftImagePath isKindOfClass:[UIImage class]]) {
                
                self.leftImageView.image = (UIImage *)leftImagePath;
            } else {
                
                [self.leftImageView sd_setImageWithURL:nil placeholderImage:self.qh_placeholderImage];
                NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
            }
            */
            
            
            /**
            if (!self.qh_onlyText && [centerImagePath isKindOfClass:[NSString class]]) {
                
                if ([centerImagePath hasPrefix:@"http"]) {
                    
                    //                [self.centerImageView sd_setImageWithURL:[NSURL URLWithString:centerImagePath]];
                    [self.centerImageView sd_setImageWithURL:[NSURL URLWithString:centerImagePath] placeholderImage:self.qh_placeholderImage];
                } else {
                    
                    UIImage *image = [UIImage imageNamed:centerImagePath];
                    if (!image) {
                        
                        image = [UIImage imageWithContentsOfFile:centerImagePath];
                    }
                    self.centerImageView.image = image;
                }
            } else if (!self.qh_onlyText && [centerImagePath isKindOfClass:[UIImage class]]) {
                
                self.centerImageView.image = (UIImage *)centerImagePath;
            } else {
                
                [self.centerImageView sd_setImageWithURL:nil placeholderImage:self.qh_placeholderImage];
                NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
            }*/
            
            
            /**
            if (!self.qh_onlyText && [rightImagePath isKindOfClass:[NSString class]]) {
                
                if ([rightImagePath hasPrefix:@"http"]) {
                    
                    //                [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:rightImagePath]];
                    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:rightImagePath] placeholderImage:self.qh_placeholderImage];
                } else {
                    
                    UIImage *image = [UIImage imageNamed:rightImagePath];
                    if (!image) {
                        
                        image = [UIImage imageWithContentsOfFile:rightImagePath];
                    }
                    self.rightImageView.image = image;
                }
            } else if (!self.qh_onlyText && [rightImagePath isKindOfClass:[UIImage class]]) {
                
                self.rightImageView.image = (UIImage *)rightImagePath;
            } else {
                
                [self.rightImageView sd_setImageWithURL:nil placeholderImage:self.qh_placeholderImage];
                NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
            }
            */
            
            // 文本数据
            if (self.qh_textArray && self.qh_textArray.count == self.dataSourceArray.count) {
                
                self.leftTextLabel.text = self.qh_textArray[leftIndex];
                self.centerTextLabel.text = self.qh_textArray[currentIndex];
                self.rightTextLabel.text = self.qh_textArray[rightIndex];
            } else {
                
#warning tip 图片和文本数据不一致，默认只显示第一个文本
                self.leftTextLabel.text = self.centerTextLabel.text = self.rightTextLabel.text = [self.qh_textArray firstObject];
//                NSLog(@"%s -- %d", __FUNCTION__, __LINE__);
            }
        }
    }
    
    // 设置contentOffset偏移量
    [self setScrollViewContentOffset];
    self.pageControl.currentPage = currentIndex;
}

#pragma mark - Getter
/// 容器视图
- (UIScrollView *)containerView {
    
    if (!_containerView) {
        
        _containerView = [[UIScrollView alloc] init];
        _containerView.delegate = self;
        _containerView.pagingEnabled = YES;
        _containerView.showsVerticalScrollIndicator = NO;
        _containerView.showsHorizontalScrollIndicator = NO;
        _containerView.directionalLockEnabled = YES;
    }
    
    return _containerView;
}

/// 分页控件
- (UIPageControl *)pageControl {
    
    if (!_pageControl) {
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = _qh_pageDotColor;
        _pageControl.currentPageIndicatorTintColor = _qh_currentPageDotColor;
    }
    
    return _pageControl;
}

/// 左文本框
- (UILabel *)leftTextLabel {
    
    if (!_leftTextLabel) {
        
        _leftTextLabel = [[UILabel alloc] init];
    }
    
    return _leftTextLabel;
}

/// 中文本框
- (UILabel *)centerTextLabel {
    
    if (!_centerTextLabel) {
        
        _centerTextLabel = [[UILabel alloc] init];
    }
    
    return _centerTextLabel;
}

/// 右文本框
- (UILabel *)rightTextLabel {
    
    if (!_rightTextLabel) {
        
        _rightTextLabel = [[UILabel alloc] init];
    }
    
    return _rightTextLabel;
}

/// 左图片框
- (GQHMultimediaView *)leftImageView {
    
    if (!_leftImageView) {
        
        _leftImageView = [[GQHMultimediaView alloc] init];
        _leftImageView.backgroundColor = UIColor.whiteColor;
        _leftImageView.contentMode = self.qh_slideViewContentMode;
        _leftImageView.layer.masksToBounds= YES;
    }
    
    return _leftImageView;
}

/// 中图片框
- (GQHMultimediaView *)centerImageView {
    
    if (!_centerImageView) {
        
        _centerImageView = [[GQHMultimediaView alloc] init];
        _centerImageView.backgroundColor = UIColor.whiteColor;
        _centerImageView.contentMode = self.qh_slideViewContentMode;
        _centerImageView.layer.masksToBounds= YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedSlideView:)];
        [_centerImageView addGestureRecognizer:tap];
        _centerImageView.userInteractionEnabled = YES;
    }
    
    return _centerImageView;
}

/// 右图片框
- (UIImageView *)rightImageView {
    
    if (!_rightImageView) {
        
        _rightImageView = [[GQHMultimediaView alloc] init];
        _rightImageView.backgroundColor = UIColor.whiteColor;
        _rightImageView.contentMode = self.qh_slideViewContentMode;
        _rightImageView.layer.masksToBounds= YES;
    }
    
    return _rightImageView;
}

@end
