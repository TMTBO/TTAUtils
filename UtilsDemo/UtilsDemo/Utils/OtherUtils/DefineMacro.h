/*==================== 调试输出 ========================*/
#pragma mark - 调试输出
#ifdef __OBJC__
#ifdef DEBUG
#define NSLog(fmt, ...)                                                        \
  NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif


/*==================== Screen ========================*/
#pragma mark - Screen
#define kSCREEN_SCALE [UIScreen mainScreen].scale
#define kSCREEN_BOUNDS [UIScreen mainScreen].bounds

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // 当前Xcode支持iOS8及以上
#define KSCREEN_WIDTH ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define kSCREENH_HEIGHT ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#define kSCREEN_SIZE ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)
#else
#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kSCREEN_SIZE [UIScreen mainScreen].bounds.size
#endif

/*==================== 角度与弧度转换 ========================*/
#pragma mark - 角度与弧度转换
#define DEGREES_TO_RADIAN(x) (M_PI * (x) / 180.0)
#define RADIAN_TO_DEGREES(x) (180.0 * (x) / M_PI)

/*==================== Color ========================*/
#pragma mark - Color
// 取色值相关的方法
#define RGB(r,g,b)          [UIColor colorWithRed:(r)/255.f \
green:(g)/255.f \
blue:(b)/255.f \
alpha:1.f]

#define RGBA(r,g,b,a)       [UIColor colorWithRed:(r)/255.f \
green:(g)/255.f \
blue:(b)/255.f \
alpha:(a)]

#define RGBOF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define RGBA_OF(rgbValue)   [UIColor colorWithRed:((float)(((rgbValue) & 0xFF000000) >> 24))/255.0 \
green:((float)(((rgbValue) & 0x00FF0000) >> 16))/255.0 \
blue:((float)(rgbValue & 0x0000FF00) >> 8)/255.0 \
alpha:((float)(rgbValue & 0x000000FF))/255.0]

#define RGBAOF(v, a)        [UIColor colorWithRed:((float)(((v) & 0xFF0000) >> 16))/255.0 \
green:((float)(((v) & 0x00FF00) >> 8))/255.0 \
blue:((float)(v & 0x0000FF))/255.0 \
alpha:a]

// 定义通用颜色
#define kBLACK_COLOR         [UIColor blackColor]
#define kDARK_GRAY_COLOR     [UIColor darkGrayColor]
#define kLIGHT_GRAY_COLOR    [UIColor lightGrayColor]
#define kWhHITE_COLOR        [UIColor whiteColor]
#define kGRAY_COLOR          [UIColor grayColor]
#define kRED_COLOR           [UIColor redColor]
#define kGREEN_COLOR         [UIColor greenColor]
#define kBLUE_COLOR          [UIColor blueColor]
#define kCYAN_COLOR          [UIColor cyanColor]
#define kYELLOW_COLOR        [UIColor yellowColor]
#define kMAGENTA_COLOR       [UIColor magentaColor]
#define kORANGE_COLOR        [UIColor orangeColor]
#define kPURPLE_COLOR        [UIColor purpleColor]
#define kCLEAR_COLOR         [UIColor clearColor]

#define kRANDOM_COLOR    [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]

/*==================== NotificationCenter ========================*/
#pragma mark - NotificationCenter
#define NOTIFICATION_CENTER [NSNotificationCenter defaultCenter]

/*==================== WeakObject ========================*/
#pragma mark - WeakObject
#define WEAK_OBJECT(type)  __weak typeof(type) ##typeWeak = type;
#define STRONG_OBJECT(type)  __strong typeof(type) type = ##typeWeak;

/*==================== ActivityIndicator ========================*/
#pragma mark - ActivityIndicator
// 加载
#define kShowNetworkActivityIndicator() [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
// 收起加载
#define kHideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
// 设置加载
#define kNetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x

#define kKeyWindow [UIApplication sharedApplication].keyWindow

/*==================== 沙盒路径 ========================*/
#pragma mark - 沙盒路径
//获取temp
#define kPATH_TEMP_PATH NSTemporaryDirectory()

//获取沙盒 Document
#define kPATH_DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPATH_CACHES_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

