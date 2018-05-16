//
//  GTFormStaticRowDescriptor.m
//  GTForm
//
//  Created by liuxc on 2018/5/15.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "GTFormStaticRowDescriptor.h"

@implementation GTFormStaticRowDescriptor


+ (instancetype)formStaticRowDescriptorWithTag:(NSString *)tag title:(NSString *)title staticStyle:(GTFormStaticType)staticStyle
{
    GTFormStaticRowDescriptor *staticRowDescriptor = [[self alloc] initWithTag:tag rowType:GTFormRowDescriptorTypeStatic title:title];
    [staticRowDescriptor initData];
    staticRowDescriptor.staticStyle = staticStyle;
    return staticRowDescriptor;
}

+ (instancetype)formStaticRowDescriptorWithTag:(NSString *)tag title:(NSString *)title detailTitle:(NSString *)detailTitle staticStyle:(GTFormStaticType)staticStyle
{
    GTFormStaticRowDescriptor *staticRowDescriptor = [[self alloc] initWithTag:tag rowType:GTFormRowDescriptorTypeStatic title:title];
    [staticRowDescriptor initData];
    staticRowDescriptor.detailTitle = detailTitle;
    staticRowDescriptor.staticStyle = staticStyle;
    return staticRowDescriptor;
}

+ (instancetype)formStaticRowDescriptorWithTag:(NSString *)tag title:(NSString *)title icon:(NSString *)icon staticStyle:(GTFormStaticType)staticStyle
{
    GTFormStaticRowDescriptor *staticRowDescriptor = [[self alloc] initWithTag:tag rowType:GTFormRowDescriptorTypeStatic title:title];
    [staticRowDescriptor initData];
    staticRowDescriptor.icon = icon;
    staticRowDescriptor.staticStyle = staticStyle;
    return staticRowDescriptor;
}

+ (instancetype)formStaticRowDescriptorWithTag:(NSString *)tag title:(NSString *)title detailTitle:(NSString *)detailTitle icon:(NSString *)icon staticStyle:(GTFormStaticType)staticStyle
{
    GTFormStaticRowDescriptor *staticRowDescriptor = [[self alloc] initWithTag:tag rowType:GTFormRowDescriptorTypeStatic title:title];
    [staticRowDescriptor initData];
    staticRowDescriptor.icon = icon;
    staticRowDescriptor.detailTitle = detailTitle;
    staticRowDescriptor.staticStyle = staticStyle;
    return staticRowDescriptor;
}



- (void)initData {
    _iconImage = nil;
    _icon = @"";
    _detailTitle = @"";
    _arrowImage = nil;
    _textSpace = 15;
    _textColor = nil;
    _detailTextColor = nil;
    _textFont = nil;
    _detailTextFont = nil;
    _separatorAlignType = GTFormStaticCellSeparatorAlignTypeImage;
    _detailStyle = GTFormStaticDetailStyleBottom;
    _iconSize = CGSizeMake(30, 30);
    _iconCornerRadius = 5;
    _iconBorderWidth = 0;
    _iconStyle = GTFormStaticIconStyleLeft;
    _hideArrow = NO;
}



@end
