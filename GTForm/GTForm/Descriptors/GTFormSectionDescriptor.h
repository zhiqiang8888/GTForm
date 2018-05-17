//
//  GTFormSectionDescriptor.h
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

#import "GTFormRowDescriptor.h"
#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, GTFormSectionOptions) {
    GTFormSectionOptionNone        = 0,
    GTFormSectionOptionCanInsert   = 1 << 0,
    GTFormSectionOptionCanDelete   = 1 << 1,
    GTFormSectionOptionCanReorder  = 1 << 2
};

typedef NS_ENUM(NSUInteger, GTFormSectionInsertMode) {
    GTFormSectionInsertModeLastRow = 0,
    GTFormSectionInsertModeButton = 2
};

@class GTFormDescriptor;

@interface GTFormSectionDescriptor : NSObject

@property (nonatomic, nullable) NSString * title;
@property (nonatomic, nullable) NSString * footerTitle;
@property (readonly, nonnull) NSMutableArray * formRows;
@property (nonatomic) CGFloat headerHeight;             
@property (nonatomic) CGFloat footerHeight;


@property (nonatomic, assign) BOOL cellTitleEqualWidth;
@property (nonatomic) CGFloat cellTitleMaxWidth;

@property (readonly) GTFormSectionInsertMode sectionInsertMode;
@property (readonly) GTFormSectionOptions sectionOptions;
@property (nullable) GTFormRowDescriptor * multivaluedRowTemplate;
@property (readonly, nullable) GTFormRowDescriptor * multivaluedAddButton;
@property (nonatomic, nullable) NSString * multivaluedTag;

@property (weak, null_unspecified) GTFormDescriptor * formDescriptor;

@property (nonnull) id hidden;
-(BOOL)isHidden;

+(nonnull instancetype)formSection;
+(nonnull instancetype)formSectionWithTitle:(nullable NSString *)title;
+(nonnull instancetype)formSectionWithTitle:(nullable NSString *)title multivaluedSection:(BOOL)multivaluedSection DEPRECATED_ATTRIBUTE DEPRECATED_MSG_ATTRIBUTE("Use formSectionWithTitle:sectionType: instead");
+(nonnull instancetype)formSectionWithTitle:(nullable NSString *)title sectionOptions:(GTFormSectionOptions)sectionOptions;
+(nonnull instancetype)formSectionWithTitle:(nullable NSString *)title sectionOptions:(GTFormSectionOptions)sectionOptions sectionInsertMode:(GTFormSectionInsertMode)sectionInsertMode;

-(BOOL)isMultivaluedSection;
-(void)addFormRow:(nonnull GTFormRowDescriptor *)formRow;
-(void)addFormRow:(nonnull GTFormRowDescriptor *)formRow afterRow:(nonnull GTFormRowDescriptor *)afterRow;
-(void)addFormRow:(nonnull GTFormRowDescriptor *)formRow beforeRow:(nonnull GTFormRowDescriptor *)beforeRow;
-(void)removeFormRowAtIndex:(NSUInteger)index;
-(void)removeFormRow:(nonnull GTFormRowDescriptor *)formRow;
-(void)moveRowAtIndexPath:(nonnull NSIndexPath *)sourceIndex toIndexPath:(nonnull NSIndexPath *)destinationIndex;

@end
