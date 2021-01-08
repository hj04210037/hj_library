//
//  GQHMultimediaView.h
//  视频和图片的混合轮播
//
//  Created by Mac on 2019/5/22.
//  Copyright © 2019 WangShuai. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 多媒体视图视频播放状态

 - GQHMultimediaViewPlayerStateStart: 开始状态
 - GQHMultimediaViewPlayerStatePause: 暂停播放状态
 - GQHMultimediaViewPlayerStatePlaying: 正在播放状态
 - GQHMultimediaViewPlayerStateReplay: 重新播放状态
 */
typedef NS_ENUM(NSUInteger, GQHMultimediaViewPlayerState) {
    
    GQHMultimediaViewPlayerStateStart,
    GQHMultimediaViewPlayerStatePause,
    GQHMultimediaViewPlayerStatePlaying,
    GQHMultimediaViewPlayerStateReplay,
};


NS_ASSUME_NONNULL_BEGIN

@interface GQHMultimediaView : UIImageView

/**
 图片、视频地址
 */
@property (nonatomic, copy) NSString *qh_URLString;

/**
 进度条的值
 */
@property (nonatomic, assign) CGFloat qh_progress;

@end

NS_ASSUME_NONNULL_END
