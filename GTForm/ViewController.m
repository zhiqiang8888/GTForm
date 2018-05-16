//
//  ViewController.m
//  GTForm
//
//  Created by liuxc on 2018/5/15.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "ViewController.h"

NSString * const kTextFieldAndTextView = @"TextFieldAndTextView";
NSString * const kSelectors = @"Selectors";
NSString * const kOthes = @"Others";
NSString * const kDates = @"Dates";
NSString * const kPredicates = @"BasicPredicates";
NSString * const kBlogExample = @"BlogPredicates";
NSString * const kMultivalued = @"Multivalued";
NSString * const kMultivaluedOnlyReorder = @"MultivaluedOnlyReorder";
NSString * const kMultivaluedOnlyInsert = @"MultivaluedOnlyInsert";
NSString * const kMultivaluedOnlyDelete = @"MultivaluedOnlyDelete";
NSString * const kValidations= @"Validations";
NSString * const kFormatters = @"Formatters";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    
}


- (void)initData {
    GTFormDescriptor * form;
    GTFormSectionDescriptor * section;

    form = [GTFormDescriptor formDescriptor];

    section = [GTFormSectionDescriptor formSectionWithTitle:@""];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [form addFormSection:section];

    // NativeEventFormViewController
//    row = [GTFormRowDescriptor formRowDescriptorWithTag:@"realExamples" rowType:GTFormRowDescriptorTypeButton title:@"iOS Calendar Event Form"];
//    row.action.viewControllerStoryboardId = @"aaa";

    GTFormStaticRowDescriptor* row1 = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"realExamples" title:@"realExamples0" detailTitle:@"车市一" icon:@"icon" staticStyle:GTFormStaticTypeIcon];


    row1.detailStyle      = GTFormStaticDetailStyleBottom;  // 设置detailTextLabel位置
    row1.detailTitle      = @"微信号：12345";
    row1.detailTextFont   = [UIFont systemFontOfSize:13];
    row1.detailTextColor  = [UIColor blackColor];
    row1.height           = 95; // 设置cell高度
    row1.iconSize         = CGSizeMake(70, 70); // 设置图片尺寸
    row1.iconCornerRadius = 5; // 设置图片圆角

    [section addFormRow:row1];

    GTFormSectionDescriptor *section1 = [GTFormSectionDescriptor formSectionWithTitle:@""];
    section1.headerHeight = 0;
    section1.footerHeight = 0;
    [form addFormSection:section1];

    GTFormStaticRowDescriptor* row2 = [GTFormStaticRowDescriptor formStaticRowDescriptorWithTag:@"realExamples1" title:@"realExamples1" detailTitle:@"啊啊啊啊" icon:@"ic_favorites" staticStyle:GTFormStaticTypeArrow];
    
    row2.detailStyle = GTFormStaticDetailStyleRight;
    row2.detailTitle = @"哈哈哈";
    [section1 addFormRow:row2];

    self.form = form;
    
    
    
}

- (void)selectAction {

}

@end
