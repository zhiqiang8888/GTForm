//
//  GTFormDescriptor.h
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

#import "GTFormSectionDescriptor.h"
#import "GTFormRowDescriptor.h"
#import "GTFormDescriptorDelegate.h"
#import <Foundation/Foundation.h>

extern NSString * __nonnull const GTFormErrorDomain;
extern NSString * __nonnull const GTValidationStatusErrorKey;

typedef NS_ENUM(NSInteger, GTFormErrorCode)
{
    GTFormErrorCodeGen = -999,
    GTFormErrorCodeRequired = -1000
};

typedef NS_OPTIONS(NSUInteger, GTFormRowNavigationOptions) {
    GTFormRowNavigationOptionNone                               = 0,
    GTFormRowNavigationOptionEnabled                            = 1 << 0,
    GTFormRowNavigationOptionStopDisableRow                     = 1 << 1,
    GTFormRowNavigationOptionSkipCanNotBecomeFirstResponderRow  = 1 << 2,
    GTFormRowNavigationOptionStopInlineRow                      = 1 << 3,
};

@class GTFormSectionDescriptor;

@interface GTFormDescriptor : NSObject

@property (readonly, nonatomic, nonnull) NSMutableArray * formSections;
@property (readonly, nullable) NSString * title;
@property (nonatomic) BOOL endEditingTableViewOnScroll;
@property (nonatomic) BOOL assignFirstResponderOnShow;
@property (nonatomic) BOOL addAsteriskToRequiredRowsTitle;
@property (getter=isDisabled) BOOL disabled;
@property (nonatomic) GTFormRowNavigationOptions rowNavigationOptions;

@property (weak, nullable) id<GTFormDescriptorDelegate> delegate;

+(nonnull instancetype)formDescriptor;
+(nonnull instancetype)formDescriptorWithTitle:(nullable NSString *)title;

-(void)addFormSection:(nonnull GTFormSectionDescriptor *)formSection;
-(void)addFormSection:(nonnull GTFormSectionDescriptor *)formSection atIndex:(NSUInteger)index;
-(void)addFormSection:(nonnull GTFormSectionDescriptor *)formSection afterSection:(nonnull GTFormSectionDescriptor *)afterSection;
-(void)addFormRow:(nonnull GTFormRowDescriptor *)formRow beforeRow:(nonnull GTFormRowDescriptor *)afterRow;
-(void)addFormRow:(nonnull GTFormRowDescriptor *)formRow beforeRowTag:(nonnull NSString *)afterRowTag;
-(void)addFormRow:(nonnull GTFormRowDescriptor *)formRow afterRow:(nonnull GTFormRowDescriptor *)afterRow;
-(void)addFormRow:(nonnull GTFormRowDescriptor *)formRow afterRowTag:(nonnull NSString *)afterRowTag;
-(void)removeFormSectionAtIndex:(NSUInteger)index;
-(void)removeFormSection:(nonnull GTFormSectionDescriptor *)formSection;
-(void)removeFormRow:(nonnull GTFormRowDescriptor *)formRow;
-(void)removeFormRowWithTag:(nonnull NSString *)tag;

-(nullable GTFormRowDescriptor *)formRowWithTag:(nonnull NSString *)tag;
-(nullable GTFormRowDescriptor *)formRowAtIndex:(nonnull NSIndexPath *)indexPath;
-(nullable GTFormRowDescriptor *)formRowWithHash:(NSUInteger)hash;
-(nullable GTFormSectionDescriptor *)formSectionAtIndex:(NSUInteger)index;

-(nullable NSIndexPath *)indexPathOfFormRow:(nonnull GTFormRowDescriptor *)formRow;

-(nonnull NSDictionary *)formValues;
-(nonnull NSDictionary *)httpParameters:(nonnull GTFormViewController *)formViewController;

-(nonnull NSArray *)localValidationErrors:(nonnull GTFormViewController *)formViewController;
-(void)setFirstResponder:(nonnull GTFormViewController *)formViewController;

-(nullable GTFormRowDescriptor *)nextRowDescriptorForRow:(nonnull GTFormRowDescriptor *)currentRow;
-(nullable GTFormRowDescriptor *)previousRowDescriptorForRow:(nonnull GTFormRowDescriptor *)currentRow;

-(void)forceEvaluate;

@end
