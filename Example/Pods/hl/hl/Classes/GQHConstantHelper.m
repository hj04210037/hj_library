//
//  GQHConstantHelper.m
//  Seed
//
//  Created by GuanQinghao on 2018/6/16.
//  Copyright © 2018 GuanQinghao. All rights reserved.
//

#import "GQHConstantHelper.h"


#pragma mark - color
/// TabBarItem默认颜色 #111111
NSString * const GQHTabBarItemNormalColor = @"#111111";
/// TabBarItem选中颜色 #ff4643
NSString * const GQHTabBarItemSelectedColor = @"#ff4643";
/// 视图背景色 #f2f2f2
NSString * const GQHViewBackgroundColor = @"#f2f2f2";
/// 用户等级背景色 #e9c65a
NSString * const GQHUserRankBackgroundColor = @"#e9c65a";
/// 分割线颜色 #e1e1e1
NSString * const GQHSplitLineColor = @"#e1e1e1";

#pragma mark --字体颜色
/// 黑色 #111111
NSString * const GQHFontColorBlack = @"#111111";
/// 深黑色 #333333
NSString * const GQHFontColorDarkBlack = @"#333333";
/// 灰色 #878787
NSString * const GQHFontColorGray = @"#878787";
/// 浅灰色 #adadad
NSString * const GQHFontColorLightGray = @"#adadad";
/// 红色 #ff0030
NSString * const GQHFontColorRed = @"#ff4643";



#pragma mark - font
/// 最小字体 小字
CGFloat const GQHSmallestFont = 10.0f;
/// 副文、列表副文
CGFloat const GQHSmallerFont = 14.0f;
/// 正文、列表正文
CGFloat const GQHDefaultFont = 16.0f;
/// 标题、按钮
CGFloat const GQHBiggerFont = 18.0f;
/// 最大字体 导航、突出内容
CGFloat const GQHBiggestFont = 20.0f;


#pragma mark - UI参数
/// 全局常量-单倍外边距
CGFloat const GQHSingleMargin = 15.0f;
/// 全局常量-双倍外边距
CGFloat const GQHDoubleMargin = 2 * GQHSingleMargin;
/// 全局常量-线的粗细
CGFloat const GQHLineWidth = 0.75f;
/// 视图布局最小尺寸
CGFloat const GQHMinLayoutSize = 10.0f;
/// 普通按钮高度
CGFloat const GQHButtonNormalHeight = 44.0f;

#pragma makr - 网络请求
/// 成功code 1
NSInteger const GQHHTTPStatusOKCode = 1;
/// 无服务code 503
NSInteger const GQHHTTPStatusNoServiceCode = 503;
/// 无效的令牌code 101
NSInteger const GQHHTTPStatusUnauthorizedCode = 101;


#pragma mark - 业务参数
/// 意见反馈最大图片数
NSInteger const GQHFeedbackPictureMaxCount = 4;
/// 接口根域名地址
NSString * const GQHAPIServerBaseURL = @"";

/// API头部授权KEY
NSString * const kAPIAuthorizationKey = @"Authorization";


/// 接口路径地址
//NSString * const GQHAPIPathURL = @"https://1chalk.com/mall-app";
/**
 测试
 */
//NSString * const GQHAPIPathURL = @"https://ysxtest.zhiyousx.com/api/app";

/**
 开发
 */
NSString * const GQHAPIPathURL = @"https://ysxdev.zhiyousx.com/api/app";
/**
 预发布
 */

//NSString * const GQHAPIPathURL = @"https://ysxadv.zhiyousx.com/api/app";
//NSString * const GQHAPIPathURL = @"https://eshop.zhiyousx.com/api/app";
//NSString * const GQHAPIPathURL = @"https://1chalk.com/dsmall-app-api";
//NSString * const GQHAPIPathURL = @"http://gd59c4.natappfree.cc";

//NSString * const GQHAPIPathURL = @"http://xiaoqiangge.51vip.biz:29429";


/// 图片服务器地址
NSString * const GQHPictureServerURL = @"https://1chalk.com";
/// 文件服务器地址
NSString * const GQHFileServerURL = @"https://1chalk.com";
/// 通用链接地址
NSString * const GQHUniversalLink = @"https://eshop.zhiyousx.com/";
///微信appid
NSString *const JDWechatAppid = @"wx105db61da2a4a582";

#pragma mark - 图片资源名称
/// TabBar
NSString * const GQHTabBarItemHomeNormal = @"tab_home_icon_normal";
NSString * const GQHTabBarItemHomeSelected = @"tab_home_icon_selected";
NSString * const GQHTabBarItemProductsNormal = @"tab_destination_icon_normal";
NSString * const GQHTabBarItemProductsSelected = @"tab_destination_icon_selected";


NSString * const GQHTabBarItemTravelNormal = @"tab_travel_icon_normal";
NSString * const GQHTabBarItemTravelSelected = @"tab_travel_icon_selected";

NSString * const GQHTabBarItemCartNormal = @"TabBarItemCartNormal";
NSString * const GQHTabBarItemCartSelected = @"TabBarItemCartSelected";


NSString * const GQHTabBarItemMeNormal = @"tab_mine_icon_normal";
NSString * const GQHTabBarItemMeSelected = @"tab_mine_icon_selected";

/// NavigationBar
NSString * const GQHNavigationBarLeftArrow = @"NavigationBarLeftArrow";
NSString * const GQHNavigationBarLeftWhiteArrow = @"NavigationBarLeftWhiteArrow";

/// 我的
NSString * const GQHMeBackgroundImage = @"MeBackgroundImage";
NSString * const GQHMeAvatarPlaceholder = @"MeAvatarPlaceholder";
NSString * const GQHMeCheckIn = @"MeCheckIn";
NSString * const GQHMeRightArrow = @"MeRightArrow";
NSString * const GQHMeAllOrders = @"MeAllOrders";
NSString * const GQHMeObligationOrders = @"MeObligationOrders";
NSString * const GQHMePaidOrders = @"MePaidOrders";
NSString * const GQHMeDispatchOrders = @"MeDispatchOrders";
NSString * const GQHMeAddPicture = @"MeAddPicture";
NSString * const GQHMeRemovePicture = @"MeRemovePicture";
NSString * const GQHMeOrderCancelClose = @"MeOrderCancelClose";
NSString * const GQHMeOrderDetailStatus = @"MeOrderDetailStatus";
NSString * const GQHMeOrderDetailAddress = @"MeOrderDetailAddress";
NSString * const GQHMeMessageAchievement = @"MeMessageAchievement";
NSString * const GQHMeMessageAction = @"MeMessageAction";
NSString * const GQHMeMessageSystem = @"MeMessageSystem";
NSString * const GQHMeOrderDelivery = @"MeOrderDelivery";
NSString * const GQHMeAddressNoDataPlaceholderImage = @"MeAddressNoDataPlaceholderImage";
NSString * const GQHMeMeOrderNoDataPlaceholderImage = @"MeOrderNoDataPlaceholderImage";
NSString * const NYZHomeTopBaoYou = @"HomeTopBaoYou";
NSString * const NYZHomeTopPeiSong = @"HomeTopPeiSong";
NSString * const NYZHomeTopShouHou = @"HomeTopShouHou";
NSString * const NYZHomeTopZhengPin = @"HomeTopZhengPin";

/// 登录/注册
NSString * const GQHLoginEyeOff = @"LoginEyeOff";
NSString * const GQHLoginEyeOn = @"LoginEyeOn";

/// 首页
NSString * const GQHHomeBannerBackground = @"HomeBannerBackground";
NSString * const GQHHomeHot = @"HomeHot";
NSString * const GQHHomeItemCheckIn = @"HomeItemCheckIn";
NSString * const GQHHomeItemFortune = @"HomeItemFortune";
NSString * const GQHHomeItemInvite = @"HomeItemInvite";
NSString * const GQHHomeItemMember = @"HomeItemMember";
NSString * const GQHHomeMessage = @"HomeMessage";
NSString * const GQHHomeNews = @"HomeNews";
NSString * const GQHHomeNewsIcon = @"HomeNewsIcon";
NSString * const GQHHomeNoticeIcon = @"HomeNotice";
NSString * const GQHHomeInvite = @"HomeInvite";
NSString * const GQHHomeWineBuy = @"HomeWineBuy";
NSString * const GQHHomeAttendance = @"HomeAttendance";
NSString * const GQHHomeRanksBackgroundImage = @"HomeRanksBackgroundImage";
NSString * const GQHHomeFortunes = @"HomeFortunes";
NSString * const GQHHomeSearchWhite = @"HomeSearchWhite";
NSString * const GQHHomeSearchGray = @"HomeSearchGray";
NSString * const GQHHomeDownArrowGray = @"HomeDownArrowGray";
NSString * const GQHHomeDownArrowRed = @"HomeDownArrowRed";
NSString * const GQHHomeUpArrowGray = @"HomeUpArrowGray";
NSString * const GQHHomeUpArrowRed = @"HomeUpArrowRed";
NSString * const GQHHomeFortunesPayment = @"HomeFortunesPayment";
NSString * const GQHHomeRankLevelDiamond = @"HomeRankLevelDiamond";
NSString * const GQHHomeRankLevelPlatnum = @"HomeRankLevelPlatnum";
NSString * const GQHHomeRankLevelGold = @"HomeRankLevelGold";
NSString * const GQHHomeRankLevelSilver = @"HomeRankLevelSilver";
NSString * const GQHHomeSearchNoDataPlaceholderImage = @"HomeSearchNoDataPlaceholderImage";
NSString * const GQHHomeTop = @"HomeTop";


/// 购物车
NSString * const GQHCartNormal = @"CartNormal";
NSString * const GQHCartSelected = @"CartSelected";
NSString * const GQHCartBookingAddress = @"CartBookingAddress";
NSString * const GQHCartPaid = @"CartPaid";
NSString * const GQHCartNoDataPlaceholderImage = @"CartNoDataPlaceholderImage";

/// 商品
NSString * const GQHProductsGrid = @"ProductsGrid";
NSString * const GQHProductsList = @"ProductsList";
NSString * const GQHProductsSortUpRed = @"ProductsSortUpRed";
NSString * const GQHProductsSortUpGray = @"ProductsSortUpGray";
NSString * const GQHProductsSortDownRed = @"ProductsSortDownRed";
NSString * const GQHProductsSortDownGray = @"ProductsSortDownGray";
NSString * const GQHProductsShare = @"ProductsShare";
NSString * const GQHProductsCart = @"TabBarItemCartNormal";
NSString * const GQHProductDetailShareWeChat = @"ProductDetailShareWeChat";
NSString * const GQHProductDetailShareMoments = @"ProductDetailShareMoments";
NSString * const GQHProductDetailShareClose = @"ProductDetailShareClose";
NSString * const GQHProductDetailDecrease = @"ProductDetailDecrease";
NSString * const GQHProductDetailIncrease = @"ProductDetailIncrease";
NSString * const GQHProductsNoDataPlaceholderImage = @"ProductsNoDataPlaceholderImage";
NSString * const NYZProductDetailCollectNO = @"ProductDetailCollectNO";
NSString * const NYZProductDetailCollectYES = @"ProductDetailCollectYES";
NSString * const NYZProductProductsStoreBlack = @"ProductsStoreBlack";

/// 点击分类按钮
NSString * const GQHDepartmentClickEvent = @"GQHDepartmentClickEvent";
/** 收货地址 */
NSString * const GQHMeAddressAddTag = @"MeAddressAddTag";
NSString * const GQHMeAddressContact = @"MeAddressContact";
NSString * const GQHMeAddressEdit = @"MeAddressEdit";
NSString * const GQHMeAddressLocation = @"MeAddressLocation";
NSString * const GQHMeAddressRightArrow = @"MeRightArrow";
NSString * const GQHMeAddressSwitchOff = @"MeAddressSwitchOff";
NSString * const GQHMeAddressSwitchOn = @"MeAddressSwitchOn";


#pragma mark --商品详情顶部导航视图路由响应链参数
/// 返回上一页
NSString * const GQHProductDetailViewPop = @"GQHProductDetailViewPop";
/// 返回首页
NSString * const GQHProductDetailViewPopToRoot = @"GQHProductDetailViewPopToRoot";
/// 分享商品
NSString * const GQHProductDetailViewShareProduct = @"GQHProductDetailViewShareProduct";
/// 滚动到商品详情页指定位置
NSString * const GQHProductDetailViewScrollToPosition = @"GQHProductDetailViewScrollToPosition";

#pragma mark --商品详情底部操作视图路由响应链参数
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

#pragma mark --商品详情底部操作视图路由响应链参数
/// 访问店铺
NSString * const GQHProductDetailViewVisitShop = @"GQHProductDetailViewVisitShop";
/// 与客服聊天
NSString * const GQHProductDetailViewChatService = @"GQHProductDetailViewChatService";
/// 查看购物车
NSString * const GQHProductDetailViewCheckCart = @"GQHProductDetailViewCheckCart";
/// 商品加入购物车
NSString * const GQHProductDetailViewAddProduct = @"GQHProductDetailViewAddProduct";
/// 立即购买
NSString * const GQHProductDetailViewBuyItNow = @"GQHProductDetailViewBuyItNow";



/// 无数据图片
NSString * const order_dataEmpty_orange_icon = @"order_dataEmpty_orange_icon";
/// 无数据图片
NSString * const item_dataEmpty_orange_icon = @"item_dataEmpty_orange_icon";
/// 无数据图片
NSString * const message_dataEmpty_orange_icon = @"message_dataEmpty_orange_icon";
/// 无数据图片
NSString * const coupons_dataEmpty_orange_icon = @"coupons_dataEmpty_orange_icon";
/// 无数据图片
NSString * const network_dataEmpty_orange_icon = @"network_dataEmpty_orange_icon";
/// 无数据图片
NSString * const wallet_dataEmpty_orange_icon = @"wallet_dataEmpty_orange_icon";
/// 无数据图片
NSString * const activity_notBegin_orange_icon = @"activity_notBegin_orange_icon";
/// 无数据图片
NSString * const activity_finished_orange_icon = @"activity_finished_orange_icon";


@implementation GQHConstantHelper

@end
