//
//  GTFormViewController.h
//  GTForm ( https://github.com/xmartlabs/GTForm )
//
//  Copyright (c) 2015 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>
#import "GTFormOptionsViewController.h"
#import "GTFormDescriptor.h"
#import "GTFormSectionDescriptor.h"
#import "GTFormDescriptorDelegate.h"
#import "GTFormRowNavigationAccessoryView.h"
#import "GTFormBaseCell.h"

@class GTFormViewController;
@class GTFormRowDescriptor;
@class GTFormSectionDescriptor;
@class GTFormDescriptor;
@class GTFormBaseCell;

typedef NS_ENUM(NSUInteger, GTFormRowNavigationDirection) {
    GTFormRowNavigationDirectionPrevious = 0,
    GTFormRowNavigationDirectionNext
};

@protocol GTFormViewControllerDelegate <NSObject>

@optional

-(void)didSelectFormRow:(GTFormRowDescriptor *)formRow;
-(void)deselectFormRow:(GTFormRowDescriptor *)formRow;
-(void)reloadFormRow:(GTFormRowDescriptor *)formRow;
-(GTFormBaseCell *)updateFormRow:(GTFormRowDescriptor *)formRow;

-(NSDictionary *)formValues;
-(NSDictionary *)httpParameters;

-(GTFormRowDescriptor *)formRowFormMultivaluedFormSection:(GTFormSectionDescriptor *)formSection;
-(void)multivaluedInsertButtonTapped:(GTFormRowDescriptor *)formRow;
-(UIStoryboard *)storyboardForRow:(GTFormRowDescriptor *)formRow;

-(NSArray *)formValidationErrors;
-(void)showFormValidationError:(NSError *)error;
-(void)showFormValidationError:(NSError *)error withTitle:(NSString*)title;

-(UITableViewRowAnimation)insertRowAnimationForRow:(GTFormRowDescriptor *)formRow;
-(UITableViewRowAnimation)deleteRowAnimationForRow:(GTFormRowDescriptor *)formRow;
-(UITableViewRowAnimation)insertRowAnimationForSection:(GTFormSectionDescriptor *)formSection;
-(UITableViewRowAnimation)deleteRowAnimationForSection:(GTFormSectionDescriptor *)formSection;

// InputAccessoryView
-(UIView *)inputAccessoryViewForRowDescriptor:(GTFormRowDescriptor *)rowDescriptor;
-(GTFormRowDescriptor *)nextRowDescriptorForRow:(GTFormRowDescriptor*)currentRow withDirection:(GTFormRowNavigationDirection)direction;

// highlight/unhighlight
-(void)beginEditing:(GTFormRowDescriptor *)rowDescriptor;
-(void)endEditing:(GTFormRowDescriptor *)rowDescriptor;

-(void)ensureRowIsVisible:(GTFormRowDescriptor *)inlineRowDescriptor;

@end

@interface GTFormViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, GTFormDescriptorDelegate, UITextFieldDelegate, UITextViewDelegate, GTFormViewControllerDelegate>

@property GTFormDescriptor * form;
@property IBOutlet UITableView * tableView;

-(instancetype)initWithForm:(GTFormDescriptor *)form;
-(instancetype)initWithForm:(GTFormDescriptor *)form style:(UITableViewStyle)style;
-(instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_DESIGNATED_INITIALIZER;
+(NSMutableDictionary *)cellClassesForRowDescriptorTypes;
+(NSMutableDictionary *)inlineRowDescriptorTypesForRowDescriptorTypes;

-(void)performFormSelector:(SEL)selector withObject:(id)sender;

@end
