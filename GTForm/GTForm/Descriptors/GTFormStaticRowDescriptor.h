//
//  GTFormStaticRowDescriptor.h
//  GTForm
//
//  Created by liuxc on 2018/5/15.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "GTFormRowDescriptor.h"
#import "GTForm.h"

typedef NS_ENUM(NSUInteger, GTFormStaticType) {
    GTFormStaticTypeNormal,     // 显示在左边
    GTFormStaticTypeArrow,      // 显示在中间
    GTFormStaticTypeIcon,       // 显示在右边
    GTFormStaticTypeExit,       // title显示在中间
    GTFormStaticTypeSwitch      // 右侧显示开关按钮
};

//_UITableViewCellSeparatorView
typedef NS_ENUM(NSUInteger, GTFormStaticCellSeparatorAlignType) {
    GTFormStaticCellSeparatorAlignTypeText,   // 对齐textLabel
    GTFormStaticCellSeparatorAlignTypeImage,  // 对齐ImageView（没有时对齐textLabel）
    GTFormStaticCellSeparatorAlignTypeCell    // 对齐Cell
};

// detailTitle显示的位置
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
/** 背景颜色 **/
@property (nonatomic, strong) UIColor *backgroundColor;
/** 选中背景颜色 **/
@property (nonatomic, strong) UIColor *selectBackgroundColor;

/** 详情标题 **/
@property (nullable) NSString * detailTitle;

/** icon的image对象，优先级最高 */
@property (nonatomic, strong) UIImage *iconImage;
/** icon图片的本地名称或网络地址 */
@property (nonatomic) NSString *icon;
/** icon图片的尺寸,默认nil */
@property (nonatomic, assign) CGSize iconSize;
/** icon圆角度数,默认5*/
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

//detailtitle能不能换行
@property (nonatomic, assign) BOOL fixedWidth;


/** 分割线对齐方式，默认对齐textLabel */
@property (nonatomic, assign) GTFormStaticCellSeparatorAlignType separatorAlignType;
/** detailText类型，默认None */
@property (nonatomic, assign) GTFormStaticDetailStyle detailStyle;
/** cell类型，默认None */
@property (nonatomic, assign) GTFormStaticType staticStyle;


/********************* Switch按钮配置 ********************/
/** 开关的默认状态，必须在设置了key之后再设置 */
@property (nonatomic, assign) BOOL defaultStatus;
/** switch类型是否打开，默认是NO */
@property (nonatomic, assign) BOOL open;
/** switch类型点击开关回调 */
@property (nonatomic, copy) void(^switchChangeBlock)(BOOL open);


+ (instancetype)formStaticRowDescriptorWithTag:(NSString *)tag title:(NSString *)title staticStyle:(GTFormStaticType)staticStyle;

+ (instancetype)formStaticRowDescriptorWithTag:(NSString *)tag title:(NSString *)title detailTitle:(NSString *)detailTitle staticStyle:(GTFormStaticType)staticStyle;

+ (instancetype)formStaticRowDescriptorWithTag:(NSString *)tag title:(NSString *)title icon:(NSString *)icon staticStyle:(GTFormStaticType)staticStyle;

+ (instancetype)formStaticRowDescriptorWithTag:(NSString *)tag title:(NSString *)title detailTitle:(NSString *)detailTitle icon:(NSString *)icon staticStyle:(GTFormStaticType)staticStyle;


@end
