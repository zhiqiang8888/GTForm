//
//  GTFormStaticRowDescriptor.m
//  GTForm
//
//  Created by liuxc on 2018/5/15.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "GTFormStaticRowDescriptor.h"

@implementation GTFormStaticRowDescriptor


+(instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title detailTitle:(NSString *)detailTitle;
{
    GTFormStaticRowDescriptor *staticRowDescriptor = [[self alloc] initWithTag:tag rowType:rowType title:title];
    [staticRowDescriptor initData];
    staticRowDescriptor.detailTitle = detailTitle;
    
    return staticRowDescriptor;
}


+ (instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title icon:(NSString *)icon
{
    GTFormStaticRowDescriptor *staticRowDescriptor = [[self alloc] initWithTag:tag rowType:rowType title:title];
    [staticRowDescriptor initData];
    staticRowDescriptor.icon = icon;
    
    return staticRowDescriptor;

}

+ (instancetype)formRowDescriptorWithTag:(NSString *)tag rowType:(NSString *)rowType title:(NSString *)title detailTitle:(NSString *)detailTitle icon:(NSString *)icon
{
    GTFormStaticRowDescriptor *staticRowDescriptor = [[self alloc] initWithTag:tag rowType:rowType title:title];
    [staticRowDescriptor initData];
    staticRowDescriptor.detailTitle = detailTitle;
    staticRowDescriptor.icon = icon;
    
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
    _iconSize = CGSizeMake(60, 60);
    _iconCornerRadius = 0;
    _iconBorderWidth = 0;
    _iconStyle = GTFormStaticIconStyleLeft;
    _hideArrow = NO;
}



@end
