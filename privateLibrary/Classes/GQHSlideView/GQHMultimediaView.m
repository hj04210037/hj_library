//
//  GQHMultimediaView.m
//  视频和图片的混合轮播
//
//  Created by Mac on 2019/5/22.
//  Copyright © 2019 WangShuai. All rights reserved.
//

#import "GQHMultimediaView.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <SDWebImage/SDWebImage.h>



@interface GQHMultimediaView () <AVPlayerViewControllerDelegate>

/**
 视频播放器
 */
@property (nonatomic, strong) AVPlayerViewController *videoPlayer;

/**
 进度条
 */
@property (nonatomic, strong) UIProgressView *progressView;

/**
 按钮
 */
@property (nonatomic, strong) UIButton *actionButton;

/**
 播放状态
 */
@property (nonatomic, assign) GQHMultimediaViewPlayerState playerState;

/**
 是否处于播放状态
 */
@property (nonatomic, assign) BOOL isPlaying;

/**
 播放进度 (0.0 ~ 1.0)
 */
@property (nonatomic, assign) CGFloat playProgress;

@end

@implementation GQHMultimediaView

#pragma mark - Lifecycle
- (instancetype)init {
    
    if (self = [super init]) {
        
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        // 添加播放器视图
        [self addSubview:self.videoPlayer.view];
        // 添加按钮
        [self addSubview:self.actionButton];
        // 添加进度条
        [self addSubview:self.progressView];
    }
    
    return self;
}

/**
 布局子视图 -> frame计算
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 视频播放器frame
    self.videoPlayer.view.frame = self.bounds;
    // 按钮frame
    self.actionButton.frame = self.bounds;
    // 进度条frame
    self.progressView.frame = CGRectMake(0.0f, CGRectGetHeight(self.frame) - 2.0f, CGRectGetWidth(self.frame), 2.0f);
}

#pragma mark - Delegate

#pragma mark - TargetMethod
- (IBAction)didClickActionButton:(id)sender {
    
    switch (self.playerState) {
            
        case GQHMultimediaViewPlayerStateStart: {
            
            [self.videoPlayer.player play];
            self.playerState = GQHMultimediaViewPlayerStatePlaying;
        }
            break;
        case GQHMultimediaViewPlayerStatePause: {
            
            [self.videoPlayer.player play];
            self.playerState = GQHMultimediaViewPlayerStatePlaying;
            
            if (self.progressView.progress == 1.0f) {
                
                [self.videoPlayer.player pause];
                self.playerState = GQHMultimediaViewPlayerStateReplay;
            }
        }
            break;
        case GQHMultimediaViewPlayerStatePlaying: {
            
            [self.videoPlayer.player pause];
            self.playerState = GQHMultimediaViewPlayerStatePause;
        }
            break;
        case GQHMultimediaViewPlayerStateReplay: {
            
            self.progressView.progress = 0.0f;
            [self.videoPlayer.player.currentItem seekToTime:CMTimeMake(0.0f, 1)completionHandler:nil];
            [self.videoPlayer.player play];
            self.playerState = GQHMultimediaViewPlayerStatePlaying;
        }
            break;
    }
    
    // 监听播放
    __weak __typeof(self) weakSelf = self;
    [self.videoPlayer.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0f, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        
        // 当前播放时间
        NSTimeInterval currentTime = CMTimeGetSeconds(time);
        // 视频的总时间
        NSTimeInterval totalTime = CMTimeGetSeconds(weakSelf.videoPlayer.player.currentItem.duration);
        
        // 设置进度条
        weakSelf.progressView.progress = currentTime/totalTime;
        
        if (currentTime/totalTime == 1.0f) {
            
            [weakSelf.videoPlayer.player pause];
            weakSelf.playerState = GQHMultimediaViewPlayerStateReplay;
        }
    }];
}

#pragma mark - PrivateMethod

#pragma mark - Setter
- (void)setQh_URLString:(NSString *)qh_URLString {
    
    _qh_URLString = qh_URLString;
    
    // 按钮
    if (self.actionButton) {
        
        [self.actionButton removeFromSuperview];
        self.actionButton = nil;
    }
    
    // 进度条frame
    if (self.progressView) {
        
        [self.progressView removeFromSuperview];
        self.progressView = nil;
    }
    
    // 视频播放器
    if (self.videoPlayer) {
        
        [self.videoPlayer removeFromParentViewController];
        [self.videoPlayer.view removeFromSuperview];
        self.videoPlayer = nil;
    }
    
    if ([qh_URLString isKindOfClass:[NSString class]]) {
        
        if ([qh_URLString hasPrefix:@"http"]) {
            
            NSArray *videoArray = @[@"wmv",@"avi",@"mkv",@"rmvb",@"rm",@"xvid",@"mp4",@"3gp",@"mpg",@"mp3",@"wma",@"acc",@"ogg",@"ape",@"flac",@"flv"];
            NSArray *imageArray = @[@"png",@"jpg",@"jpeg",@"gif",@"tiff"];
            NSString *URLString = [[qh_URLString lowercaseString] pathExtension];
            
            if ([videoArray containsObject:URLString]) {
                
                
                // 音视频
                // 添加播放器视图
                [self addSubview:self.videoPlayer.view];
                // 添加按钮
                [self addSubview:self.actionButton];
                // 添加进度条
                [self addSubview:self.progressView];
                
                self.videoPlayer.player = [AVPlayer playerWithURL:[NSURL URLWithString:qh_URLString]];
                
            } else if ([imageArray containsObject:URLString]) {
                // 图片
                if ([URLString isEqualToString:@"gif"]) {
                    
                    // 动态图
                    
                } else {
                    
                    // 网络图
                    [super sd_setImageWithURL:[NSURL URLWithString:qh_URLString] placeholderImage:nil];
                }
            }
        } else {
            
            UIImage *image = [UIImage imageNamed:qh_URLString];
            if (!image) {
                
                image = [UIImage imageWithContentsOfFile:qh_URLString];
            }
            self.image = image;
        }
        
    } else if ([qh_URLString isKindOfClass:[UIImage class]]) {
        
        self.image = (UIImage *)qh_URLString;
    }
    
}

- (void)setPlayerState:(GQHMultimediaViewPlayerState)playerState {
    
    _playerState = playerState;
    
    switch (self.playerState) {
            
        case GQHMultimediaViewPlayerStateStart: {
            
//            [self.actionButton setTitle:@"开始" forState:UIControlStateNormal];
        }
            break;
        case GQHMultimediaViewPlayerStatePause: {
            
//            [self.actionButton setTitle:@"播放" forState:UIControlStateNormal];
        }
            break;
        case GQHMultimediaViewPlayerStatePlaying: {
            
//            [self.actionButton setTitle:@"暂停" forState:UIControlStateNormal];
        }
            break;
        case GQHMultimediaViewPlayerStateReplay: {
            
//            [self.actionButton setTitle:@"重播" forState:UIControlStateNormal];
        }
            break;
    }
}

#pragma mark - Getter
- (AVPlayerViewController *)videoPlayer {
    
    if (!_videoPlayer) {
        
        _videoPlayer = [[AVPlayerViewController alloc] init];
        _videoPlayer.view.backgroundColor = UIColor.lightGrayColor;
        _videoPlayer.delegate = self;
        _videoPlayer.showsPlaybackControls = NO;
    }
    
    return _videoPlayer;
}

- (UIProgressView *)progressView {
    
    if (!_progressView) {
        
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectZero];
        _progressView.progressViewStyle = UIProgressViewStyleDefault;
        _progressView.progressTintColor = [UIColor orangeColor];
        _progressView.progress = 0.0f;
    }
    
    return _progressView;
}

- (UIButton *)actionButton {
    
    if (!_actionButton) {
        
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionButton.backgroundColor = [UIColor clearColor];
        _actionButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        
        [_actionButton setImage:nil forState:UIControlStateNormal];
        [_actionButton setBackgroundImage:nil forState:UIControlStateNormal];
        [_actionButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [_actionButton addTarget:self action:@selector(didClickActionButton:) forControlEvents:UIControlEventTouchUpInside];
        
        _actionButton.layer.cornerRadius = 0.0f;
        _actionButton.layer.masksToBounds = YES;
    }
    
    return _actionButton;
}

@end
