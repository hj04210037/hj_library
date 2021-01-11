//
//  GQHConstantHelper.h
//  Seed
//
//  Created by GuanQinghao on 2018/6/16.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GQHConstantHelper : NSObject

#pragma mark - color
/// TabBarItem默认颜色 #111111
UIKIT_EXTERN NSString * const GQHTabBarItemNormalColor;
/// TabBarItem选中颜色 #ff4643
UIKIT_EXTERN NSString * const GQHTabBarItemSelectedColor;
/// 视图背景色 #f2f2f2
UIKIT_EXTERN NSString * const GQHViewBackgroundColor;
/// 用户等级背景色 #e9c65a
UIKIT_EXTERN NSString * const GQHUserRankBackgroundColor;
/// 分割线颜色 #e1e1e1
UIKIT_EXTERN NSString * const GQHSplitLineColor;

#pragma mark --字体颜色
/// 黑色 #111111
UIKIT_EXTERN NSString * const GQHFontColorBlack;
/// 深黑色 #333333
UIKIT_EXTERN NSString * const GQHFontColorDarkBlack;
/// 灰色 #878787
UIKIT_EXTERN NSString * const GQHFontColorGray;
/// 浅灰色 #adadad
UIKIT_EXTERN NSString * const GQHFontColorLightGray;
/// 红色 #ff0030
UIKIT_EXTERN NSString * const GQHFontColorRed;


#pragma mark - font
/// 正文、列表正文
UIKIT_EXTERN CGFloat const GQHSmallestFont;
/// 副文、列表副文
UIKIT_EXTERN CGFloat const GQHSmallerFont;
/// 最小字体 小字
UIKIT_EXTERN CGFloat const GQHDefaultFont;
/// 标题、按钮
UIKIT_EXTERN CGFloat const GQHBiggerFont;
/// 最大字体 导航、突出内容
UIKIT_EXTERN CGFloat const GQHBiggestFont;


#pragma mark - UI参数
/// 全局常量-单倍外边距
UIKIT_EXTERN CGFloat const GQHSingleMargin;
/// 全局常量-双倍外边距
UIKIT_EXTERN CGFloat const GQHDoubleMargin;
/// 全局常量-线的粗细
UIKIT_EXTERN CGFloat const GQHLineWidth;
/// 视图布局最小尺寸
UIKIT_EXTERN CGFloat const GQHMinLayoutSize;
/// 普通按钮高度
UIKIT_EXTERN CGFloat const GQHButtonNormalHeight;


#pragma makr - 网络请求
/// 成功code 1
UIKIT_EXTERN NSInteger const GQHHTTPStatusOKCode;
/// 无服务code 503
UIKIT_EXTERN NSInteger const GQHHTTPStatusNoServiceCode;
/// 无效的令牌code 101
UIKIT_EXTERN NSInteger const GQHHTTPStatusUnauthorizedCode;


#pragma mark - 业务参数
/// 意见反馈最大图片数
UIKIT_EXTERN NSInteger const GQHFeedbackPictureMaxCount;
/// 接口根域名地址
UIKIT_EXTERN NSString * const GQHAPIServerBaseURL;

/// API头部授权KEY
UIKIT_EXTERN NSString * const kAPIAuthorizationKey;



/// 接口路径地址
UIKIT_EXTERN NSString * const GQHAPIPathURL;
/// 图片服务器地址
UIKIT_EXTERN NSString * const GQHPictureServerURL;
/// 文件服务器地址
UIKIT_EXTERN NSString * const GQHFileServerURL;
/// 通用链接地址
UIKIT_EXTERN NSString * const GQHUniversalLink;

#pragma mark - 图片资源名称
/// TabBar
UIKIT_EXTERN NSString * const GQHTabBarItemHomeNormal;
UIKIT_EXTERN NSString * const GQHTabBarItemHomeSelected;
UIKIT_EXTERN NSString * const GQHTabBarItemProductsNormal;
UIKIT_EXTERN NSString * const GQHTabBarItemProductsSelected;
UIKIT_EXTERN NSString * const GQHTabBarItemCartNormal;
UIKIT_EXTERN NSString * const GQHTabBarItemCartSelected;
UIKIT_EXTERN NSString * const GQHTabBarItemTravelNormal;
UIKIT_EXTERN NSString * const GQHTabBarItemTravelSelected;

UIKIT_EXTERN NSString * const GQHTabBarItemMeNormal;
UIKIT_EXTERN NSString * const GQHTabBarItemMeSelected;

/// NavigationBar
UIKIT_EXTERN NSString * const GQHNavigationBarLeftArrow;
UIKIT_EXTERN NSString * const GQHNavigationBarLeftWhiteArrow;

/// 我的
UIKIT_EXTERN NSString * const GQHMeBackgroundImage;
UIKIT_EXTERN NSString * const GQHMeAvatarPlaceholder;
UIKIT_EXTERN NSString * const GQHMeCheckIn;
UIKIT_EXTERN NSString * const GQHMeRightArrow;
UIKIT_EXTERN NSString * const GQHMeAllOrders;
UIKIT_EXTERN NSString * const GQHMeObligationOrders;
UIKIT_EXTERN NSString * const GQHMePaidOrders;
UIKIT_EXTERN NSString * const GQHMeDispatchOrders;
UIKIT_EXTERN NSString * const GQHMeAddPicture;
UIKIT_EXTERN NSString * const GQHMeRemovePicture;
UIKIT_EXTERN NSString * const GQHMeOrderCancelClose;
UIKIT_EXTERN NSString * const GQHMeOrderDetailStatus;
UIKIT_EXTERN NSString * const GQHMeOrderDetailAddress;
UIKIT_EXTERN NSString * const GQHMeMessageAchievement;
UIKIT_EXTERN NSString * const GQHMeMessageAction;
UIKIT_EXTERN NSString * const GQHMeMessageSystem;
UIKIT_EXTERN NSString * const GQHMeOrderDelivery;
UIKIT_EXTERN NSString * const GQHMeAddressNoDataPlaceholderImage;
UIKIT_EXTERN NSString * const GQHMeMeOrderNoDataPlaceholderImage;

/// 登录/注册
UIKIT_EXTERN NSString * const GQHLoginEyeOff;
UIKIT_EXTERN NSString * const GQHLoginEyeOn;

/// 首页
UIKIT_EXTERN NSString * const NYZHomeTopBaoYou;
UIKIT_EXTERN NSString * const NYZHomeTopPeiSong;
UIKIT_EXTERN NSString * const NYZHomeTopShouHou;
UIKIT_EXTERN NSString * const NYZHomeTopZhengPin;

UIKIT_EXTERN NSString * const GQHHomeBannerBackground;
UIKIT_EXTERN NSString * const GQHHomeHot;
UIKIT_EXTERN NSString * const GQHHomeItemCheckIn;
UIKIT_EXTERN NSString * const GQHHomeItemFortune;
UIKIT_EXTERN NSString * const GQHHomeItemInvite;
UIKIT_EXTERN NSString * const GQHHomeItemMember;
UIKIT_EXTERN NSString * const GQHHomeMessage;
UIKIT_EXTERN NSString * const GQHHomeNews;
UIKIT_EXTERN NSString * const GQHHomeNewsIcon;
UIKIT_EXTERN NSString * const GQHHomeNoticeIcon;
UIKIT_EXTERN NSString * const GQHHomeInvite;
UIKIT_EXTERN NSString * const GQHHomeWineBuy;
UIKIT_EXTERN NSString * const GQHHomeAttendance;
UIKIT_EXTERN NSString * const GQHHomeRanksBackgroundImage;
UIKIT_EXTERN NSString * const GQHHomeFortunes;
UIKIT_EXTERN NSString * const GQHHomeSearchWhite;
UIKIT_EXTERN NSString * const GQHHomeSearchGray;
UIKIT_EXTERN NSString * const GQHHomeDownArrowGray;
UIKIT_EXTERN NSString * const GQHHomeDownArrowRed;
UIKIT_EXTERN NSString * const GQHHomeUpArrowGray;
UIKIT_EXTERN NSString * const GQHHomeUpArrowRed;
UIKIT_EXTERN NSString * const GQHHomeFortunesPayment;
UIKIT_EXTERN NSString * const GQHHomeRankLevelDiamond;
UIKIT_EXTERN NSString * const GQHHomeRankLevelPlatnum;
UIKIT_EXTERN NSString * const GQHHomeRankLevelGold;
UIKIT_EXTERN NSString * const GQHHomeRankLevelSilver;
UIKIT_EXTERN NSString * const GQHHomeSearchNoDataPlaceholderImage;
UIKIT_EXTERN NSString * const GQHHomeTop;


/// 购物车
UIKIT_EXTERN NSString * const GQHCartNormal;
UIKIT_EXTERN NSString * const GQHCartSelected;
UIKIT_EXTERN NSString * const GQHCartBookingAddress;
UIKIT_EXTERN NSString * const GQHCartPaid;
UIKIT_EXTERN NSString * const GQHCartNoDataPlaceholderImage;


/// 商品
UIKIT_EXTERN NSString * const GQHProductsGrid;
UIKIT_EXTERN NSString * const GQHProductsList;
UIKIT_EXTERN NSString * const GQHProductsSortUpRed;
UIKIT_EXTERN NSString * const GQHProductsSortUpGray;
UIKIT_EXTERN NSString * const GQHProductsSortDownRed;
UIKIT_EXTERN NSString * const GQHProductsSortDownGray;
UIKIT_EXTERN NSString * const GQHProductsShare;
UIKIT_EXTERN NSString * const GQHProductsCart;
UIKIT_EXTERN NSString * const GQHProductDetailShareWeChat;
UIKIT_EXTERN NSString * const GQHProductDetailShareMoments;
UIKIT_EXTERN NSString * const GQHProductDetailShareClose;
UIKIT_EXTERN NSString * const GQHProductDetailDecrease;
UIKIT_EXTERN NSString * const GQHProductDetailIncrease;
UIKIT_EXTERN NSString * const GQHProductsNoDataPlaceholderImage;
UIKIT_EXTERN NSString * const NYZProductDetailCollectNO;
UIKIT_EXTERN NSString * const NYZProductDetailCollectYES;
UIKIT_EXTERN NSString * const NYZProductProductsStoreBlack;

/// 收获地址
UIKIT_EXTERN NSString * const GQHMeAddressAddTag;
UIKIT_EXTERN NSString * const GQHMeAddressContact;
UIKIT_EXTERN NSString * const GQHMeAddressEdit;
UIKIT_EXTERN NSString * const GQHMeAddressLocation;
UIKIT_EXTERN NSString * const GQHMeAddressRightArrow;
UIKIT_EXTERN NSString * const GQHMeAddressSwitchOff;
UIKIT_EXTERN NSString * const GQHMeAddressSwitchOn;



#pragma mark - 商品详情顶部导航视图路由响应链参数
/// 返回上一页
UIKIT_EXTERN NSString * const GQHProductDetailViewPop;
/// 返回首页
UIKIT_EXTERN NSString * const GQHProductDetailViewPopToRoot;
/// 分享商品
UIKIT_EXTERN NSString * const GQHProductDetailViewShareProduct;
/// 滚动到商品详情页指定位置
UIKIT_EXTERN NSString * const GQHProductDetailViewScrollToPosition;
UIKIT_EXTERN NSString * const GQHDepartmentClickEvent;
#pragma mark - 商品详情底部操作视图路由响应链参数
/// 访问店铺
UIKIT_EXTERN NSString * const GQHProductDetailViewVisitShop;
/// 与客服聊天
UIKIT_EXTERN NSString * const GQHProductDetailViewChatService;
/// 查看购物车
UIKIT_EXTERN NSString * const GQHProductDetailViewCheckCart;
/// 商品加入购物车
UIKIT_EXTERN NSString * const GQHProductDetailViewAddProduct;
/// 立即购买
UIKIT_EXTERN NSString * const GQHProductDetailViewBuyItNow;



/// 无数据图片
UIKIT_EXTERN NSString * const order_dataEmpty_orange_icon;
/// 无数据图片
UIKIT_EXTERN NSString * const item_dataEmpty_orange_icon;
/// 无数据图片
UIKIT_EXTERN NSString * const message_dataEmpty_orange_icon;
/// 无数据图片
UIKIT_EXTERN NSString * const coupons_dataEmpty_orange_icon;
/// 无数据图片
UIKIT_EXTERN NSString * const network_dataEmpty_orange_icon;
/// 无数据图片
UIKIT_EXTERN NSString * const wallet_dataEmpty_orange_icon;
/// 无数据图片
UIKIT_EXTERN NSString * const activity_notBegin_orange_icon;
/// 无数据图片
UIKIT_EXTERN NSString * const activity_finished_orange_icon;

@end
