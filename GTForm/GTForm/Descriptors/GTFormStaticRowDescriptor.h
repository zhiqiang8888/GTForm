//
//  GTFormStaticRowDescriptor.h
//  GTForm
//
//  Created by liuxc on 2018/5/15.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "GTFormRowDescriptor.h"

//_UITableViewCellSeparatorView
typedef NS_ENUM(NSUInteger, GTFormStaticCellSeparatorAlignType) {
    GTFormStaticCellSeparatorAlignTypeText,   // 对齐textLabel
    GTFormStaticCellSeparatorAlignTypeImage,  // 对齐ImageView（没有时对齐textLabel）
    GTFormStaticCellSeparatorAlignTypeCell    // 对齐Cell
};

// detailText显示的位置
typedef NS_ENUM(NSUInteger, GTFormStaticDetailStyle) {
    GTFormStaticDetailStyleNone,       // 无
    GTFormStaticDetailStyleBottom,     // 上下
    GTFormStaticDetailStyleCenter,     // 左中
    GTFormStaticDetailStyleRight       // 左右
};

// icon视图显示的位置
typedef NS_ENUM(NSUInteger, GTFormStaticIconStyle) {
    GTFormStaticIconStyleLeft,    // 显示在左边
    GTFormStaticIconStyleCenter,  // 显示在中间
    GTFormStaticIconStyleRight    // 显示在右边
};

@interface GTFormStaticRowDescriptor : GTFormRowDescriptor

/****************** staticCell类型的设置属性 ******************/
/** 详情标题 **/
@property (nullable) NSString * detailTitle;

/** icon的image对象，优先级最高 */
@property (nonatomic, strong) UIImage *iconImage;
/** icon图片的本地名称或网络地址 */
@property (nonatomic) NSString *icon;
/** icon图片的尺寸,默认60 */
@property (nonatomic, assign) CGSize iconSize;
/** icon圆角度数,默认宽度的一半 */
@property (nonatomic, assign) CGFloat iconCornerRadius;
/** 默认黑色 */
@property (nonatomic, strong) UIColor *iconBorderColor;
/** 默认0.5 */
@property (nonatomic, assign) CGFloat iconBorderWidth;
/** 头像显示的位置 */
@property (nonatomic, assign) GTFormStaticIconStyle iconStyle;

/** 是否隐藏右箭头，默认NO */
@property (nonatomic, assign) BOOL hideArrow;

/** 箭头的图片 */
@property (nonatomic, strong) UIImage *arrowImage;

/** textLabel距离左边（cell或imageView）的距离，默认15 */
@property (nonatomic, assign) CGFloat textSpace;
/** 设置字体大小 */
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) UIFont *detailTextFont;
/** 设置文字颜色 */
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *detailTextColor;
/** 分割线对齐方式，默认对齐textLabel */
@property (nonatomic, assign) GTFormStaticCellSeparatorAlignType separatorAlignType;
/** detailText类型，默认None */
@property (nonatomic, assign) GTFormStaticDetailStyle detailStyle;

+(instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title detailTitle:(NSString *)detailTitle;
+ (instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title icon:(NSString *)icon;
+(instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title detailTitle:(NSString *)detailTitle icon:(NSString *)icon;
/****************** staticCell类型的设置属性 ******************/


@end
