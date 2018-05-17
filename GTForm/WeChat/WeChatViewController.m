//
//  WeChatViewController.m
//  GTForm
//
//  Created by liuxc on 2018/5/16.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "WeChatViewController.h"
#import "PersonalViewController.h"

@interface WeChatViewController ()

@end

@implementation WeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"wechat";
    [self initForm];
}

- (void)initForm {

    GTFormDescriptor *form = [GTFormDescriptor formDescriptor];

    GTFormSectionDescriptor *section1 = [GTFormSectionDescriptor formSectionWithTitle:@""];
    section1.headerHeight = 15;
    section1.footerHeight = 0;
    [form addFormSection:section1];

    GTFormStaticRowDescriptor* row1 = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"realExamples" title:@"realExamples0" detailTitle:@"车市一" icon:@"icon" staticStyle:GTFormStaticTypeIcon];
    row1.detailStyle      = GTFormStaticDetailStyleBottom;  // 设置detailTextLabel位置
    row1.detailTitle      = @"微信号：12345";
    row1.detailTextFont   = [UIFont systemFontOfSize:13];
    row1.detailTextColor  = [UIColor blackColor];
    row1.height           = 95; // 设置cell高度
    row1.iconSize         = CGSizeMake(70, 70); // 设置图片尺寸
    row1.iconCornerRadius = 5; // 设置图片圆角
    [section1 addFormRow:row1];

    row1.action.formBlock = ^(GTFormRowDescriptor * _Nonnull sender) {
        [self.navigationController pushViewController:[[PersonalViewController alloc] init] animated:YES];
    };


    GTFormSectionDescriptor *section2 = [GTFormSectionDescriptor formSectionWithTitle:@""];
    section2.headerHeight = 20;
    section2.footerHeight = 0;
    [form addFormSection:section2];

    GTFormStaticRowDescriptor* bankItem = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"钱包" title:@"钱包" icon:@"ic_bankcard" staticStyle:GTFormStaticTypeArrow];
    [section2 addFormRow:bankItem];

    GTFormSectionDescriptor *section3 = [GTFormSectionDescriptor formSectionWithTitle:@""];
    section3.headerHeight = 20;
    section3.footerHeight = 0;
    [form addFormSection:section3];

    GTFormStaticRowDescriptor* favorites = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"收藏" title:@"收藏" icon:@"ic_favorites" staticStyle:GTFormStaticTypeArrow];
    [section3 addFormRow:favorites];

    GTFormStaticRowDescriptor* album = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"相册" title:@"相册" icon:@"ic_album" staticStyle:GTFormStaticTypeArrow];
    [section3 addFormRow:album];

    GTFormStaticRowDescriptor* card = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"卡包" title:@"卡包" icon:@"ic_cardpackage" staticStyle:GTFormStaticTypeArrow];
    [section3 addFormRow:card];

    GTFormStaticRowDescriptor* express = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"表情" title:@"表情" icon:@"ic_expression" staticStyle:GTFormStaticTypeArrow];
    [section3 addFormRow:express];

    GTFormSectionDescriptor *section4 = [GTFormSectionDescriptor formSectionWithTitle:@""];
    section4.headerHeight = 20;
    section4.footerHeight = 0;
    section4.cellTitleEqualWidth = NO;
    [form addFormSection:section4];

    GTFormStaticRowDescriptor* setting = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"设置" title:@"设置" icon:@"ic_setting" staticStyle:GTFormStaticTypeArrow];

    [section4 addFormRow:setting];


    GTFormStaticRowDescriptor* longText = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"哎哎哎" title:@"长文字" detailTitle:@"我突然发现爱情公寓中有个神秘人物，提到他频率很高，却从未露面，他叫楼下小黑。" staticStyle:GTFormStaticTypeNormal];
    longText.detailStyle = GTFormStaticDetailStyleRight;
    longText.fixedWidth = YES;
    [section4 addFormRow:longText];


    self.form = form;
}

@end
