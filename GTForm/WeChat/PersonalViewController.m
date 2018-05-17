//
//  PersonalViewController.m
//  GTForm
//
//  Created by liuxc on 2018/5/17.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"个人信息";
    [self initForm];
}

- (void)initForm
{
    GTFormDescriptor *form = [GTFormDescriptor formDescriptor];
    GTFormSectionDescriptor *section;
    GTFormRowDescriptor *row;
    GTFormStaticRowDescriptor *staticRow;

    section = [GTFormSectionDescriptor formSectionWithTitle:@""];
    section.headerHeight = 15;
    section.footerHeight = 0;
    [form addFormSection:section];

    staticRow = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"头像" title:@"头像" detailTitle:@"" icon:@"icon" staticStyle:GTFormStaticTypeIcon];
    staticRow.iconStyle        = GTFormStaticIconStyleRight;
    staticRow.height           = 95; // 设置cell高度
    staticRow.iconSize         = CGSizeMake(70, 70); // 设置图片尺寸
    staticRow.iconBorderWidth  = 0.5;
    staticRow.iconCornerRadius = 5; // 设置图片圆角
    [section addFormRow:staticRow];






    self.form = form;
}


@end
