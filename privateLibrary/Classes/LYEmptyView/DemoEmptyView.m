//
//  DemoEmptyView.m
//  LYEmptyViewDemo
//
//  Created by liyang on 2017/12/1.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "DemoEmptyView.h"
#import <header/Macro_shi.h>

#import "GQHConstantHelper.h"

@implementation DemoEmptyView

+ (instancetype)diyEmptyView{
    
    return [DemoEmptyView emptyViewWithImageStr:item_dataEmpty_orange_icon
                                       titleStr:@"暂无数据"
                                      detailStr:@""];
}

+ (instancetype)diyEmptyActionViewWithTarget:(id)target action:(SEL)action{
    
    return [DemoEmptyView emptyActionViewWithImageStr:network_dataEmpty_orange_icon
                                             titleStr:@"网络异常"
                                            detailStr:@""
                                          btnTitleStr:@"重新加载"
                                               target:target
                                               action:action];
}

- (void)prepare{
    [super prepare];
    
//    self.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    self.autoShowEmptyView = NO; //如果想要DemoEmptyView的效果都不是自动显隐的，这里统一设置为NO，初始化时就不必再一一去写了
    
    self.titleLabTextColor = HEXCOLOR(0x999999);
    self.titleLabFont = [UIFont systemFontOfSize:14];
    
    self.detailLabTextColor = RGB(80, 80, 80);
}

@end
