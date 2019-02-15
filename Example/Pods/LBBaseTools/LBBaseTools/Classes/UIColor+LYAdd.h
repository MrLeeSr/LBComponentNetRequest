//
//  UIColor+LYAdd.h
//

#import <UIKit/UIKit.h>

@interface UIColor (LYAdd)

#pragma mark - 16进制颜色
///=============================================================================
/// @name 16进制颜色
///=============================================================================

/**
 *  传人一个16进制的字符串，返回该16进制代表的颜色（默认alpha位1）
 *
 *  @param color 代表颜色的16进制字符串
 *
 *  @return 该16进制表示的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 *  从十六进制字符串获取颜色
 *
 *  @param color 代表颜色的16进制字符串
 *      color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *  @param alpha 颜色的透明度
 *
 *  @return 该16进制表示的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
/**
 *  传RGB颜色 不用/255.0
 *
 *  @param color 代表颜色的16进制字符串

 */
+ (UIColor *)getWithRedWithRed:(int)red green:(int)green blue:(int)blue;

+ (UIColor *)randomColor;

@end
