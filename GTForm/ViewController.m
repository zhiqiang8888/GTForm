//
//  ViewController.m
//  GTForm
//
//  Created by liuxc on 2018/5/15.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "ViewController.h"
#import "WeChatViewController.h"

NSString *const kName = @"name";
NSString *const kEmail = @"email";
NSString *const kTwitter = @"twitter";
NSString *const kZipCode = @"zipCode";
NSString *const kNumber = @"number";
NSString *const kInteger = @"integer";
NSString *const kDecimal = @"decimal";
NSString *const kPassword = @"password";
NSString *const kPhone = @"phone";
NSString *const kUrl = @"url";
NSString *const kTextView = @"textView";
NSString *const kNotes = @"notes";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GTForm";
    [self initData];
    
}


- (void)initData {
    GTFormDescriptor *form = [GTFormDescriptor formDescriptor];

    GTFormSectionDescriptor *section1 = [GTFormSectionDescriptor formSectionWithTitle:@""];
    section1.headerHeight = 10;
    section1.footerHeight = 10;
//    section1.cellTitleEqualWidth = NO;
    [form addFormSection:section1];

    GTFormStaticRowDescriptor* row1 = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"wechat" title:@"wechat" detailTitle:@"微信" icon:@"ic_favorites" staticStyle:GTFormStaticTypeArrow];
    row1.action.formSegueClass = [WeChatViewController class];
    row1.detailStyle = GTFormStaticDetailStyleRight;
    row1.action.formBlock = ^(GTFormRowDescriptor * _Nonnull sender) {
        WeChatViewController *vc = [[WeChatViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section1 addFormRow:row1];


    // Name
    GTFormRowDescriptor *row2 = [GTFormRowDescriptor formRowDescriptorWithTag:kName rowType:GTFormRowDescriptorTypeText title:@"name"];
    row2.required = YES;
    [section1 addFormRow:row2];

    // Email
    GTFormRowDescriptor *row3 = [GTFormRowDescriptor formRowDescriptorWithTag:kEmail rowType:GTFormRowDescriptorTypeEmail title:@"EmailLLLL"];
    // validate the email
    [row3 addValidator:[GTFormValidator emailValidator]];
    [section1 addFormRow:row3];

    // Twitter
    GTFormRowDescriptor *row4 = [GTFormRowDescriptor formRowDescriptorWithTag:kTwitter rowType:GTFormRowDescriptorTypePassword title:@"Twitter"];

//    row.disabled = @YES;
    row4.value = @"@no_editable";
    [section1 addFormRow:row4];

    GTFormRowDescriptor *row5 = [GTFormRowDescriptor formRowDescriptorWithTag:kTwitter rowType:GTFormRowDescriptorTypeTextView title:@"Twitter"];
    [section1 addFormRow:row5];


    self.form = form;
}

- (void)selectAction {

}

@end
