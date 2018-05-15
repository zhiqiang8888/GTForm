//
//  ViewController.m
//  GTForm
//
//  Created by liuxc on 2018/5/15.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    
}


- (void)initData {
    GTFormDescriptor *form;
    
    form = [GTFormDescriptor formDescriptor];
    
    GTFormSectionDescriptor *section0 = [GTFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section0];
        
    GTFormStaticRowDescriptor *iconItem =  [GTFormStaticRowDescriptor formRowDescriptorWithTag:@"image" rowType:GTFormRowDescriptorTypeStatic title:@"用户" detailTitle:@"微信号：12345" icon:@"icon"];
    iconItem.detailTextFont   = [UIFont systemFontOfSize:13];
    iconItem.detailTextColor  = [UIColor blackColor];
    iconItem.height           = 95; // 设置cell高度
    iconItem.iconSize         = CGSizeMake(70, 70); // 设置图片尺寸
    iconItem.iconCornerRadius = 5; // 设置图片圆角
    
    [section0 addFormRow:iconItem];
    
    GTFormSectionDescriptor *section1 = [GTFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section1];
    
    GTFormStaticRowDescriptor *favoritesItem =  [GTFormStaticRowDescriptor formRowDescriptorWithTag:@"ic_favorites" rowType:GTFormRowDescriptorTypeStatic title:@"收藏" detailTitle:@"" icon:@"ic_favorites"];
    favoritesItem.cellStyle = UITableViewCellStyleDefault;

//    favoritesItem.iconSize         = CGSizeMake(44, 44); // 设置图片尺寸
//    iconItem.iconCornerRadius = 0; // 设置图片圆角
    
    
    [section1 addFormRow: favoritesItem];
    
    self.form = form;
    
    
    
}


@end
