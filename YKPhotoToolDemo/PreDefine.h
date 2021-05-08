//
//  PreDefine.h
//  YKPhotoToolDemo
//
//  Created by Kevin on 2021/5/8.
//

#ifndef PreDefine_h
#define PreDefine_h

/* ==================================system======================================== */

#define kSCREEN_SIZE    [[UIScreen mainScreen] bounds].size         //!< 屏幕的Size
#define kSCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height  //!< 屏幕的Height
#define kSCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width   //!< 屏幕的Width

// iPhone X判断
#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

//导航栏高度
#define kNAavigationBarHeight self.navigationController.navigationBar.frame.size.height
//状态栏高度
#define kSTATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height


/* ==================================判断======================================== */

//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//对象是否为空
#define kIsNullObject(obj) (obj == nil || obj == Nil || obj == NULL || [obj isKindOfClass:[NSNull class]] || ![obj isKindOfClass:[NSObject class]] || [obj isEqual:[NSNull null]])
//字符串是否为空
#define kIsNullString(str) (IsNullObject(str) || ![str isKindOfClass:[NSString class]] || [str length] == 0)
//data是否为空
#define kIsNullData(data) (IsNullObject(data) || ![data isKindOfClass:[NSData class]] || [data length] == 0)
//字典是否为空
#define kIsNullDictionary(dict) (IsNullObject(dict) || ![dict isKindOfClass:[NSDictionary class]] || [dict count] == 0)
//object转字符串
#define kStringFormat(obj) [NSString stringWithFormat:@"%@",obj]


/* ==================================字号======================================== */
//字号设置
#define kFontMediumStyle(s) [UIFont fontWithName:@"PingFangSC-Medium" size:s]
#define kFontRegularStyle(s) [UIFont fontWithName:@"PingFangSC-Regular" size:s]
#define kFontSystem(s) [UIFont systemFontOfSize:s]



/* ==================================Color======================================== */
#define kRGBAlpha(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
//16进制颜色
#define kRGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

/* ==================================通用配置======================================== */
// Cell分割线颜色
#define kLineColor kRGBAlpha(238, 238, 238, 1)
//通用占位图片
#define kPlaceholderImage [UIImage imageNamed:@"background_default"]
#define kPlaceholderUserImage [UIImage imageNamed:@"defaultuser"]
//全局通用每页请求数据条数
#define kPageSize 15

/** block弱引用 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif
/** block强引用 */
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif



#endif /* PreDefine_h */
