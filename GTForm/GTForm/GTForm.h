//
//  GTForm.h
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

#import <Foundation/Foundation.h>

//Descriptors
#import "GTFormDescriptor.h"
#import "GTFormRowDescriptor.h"
#import "GTFormStaticRowDescriptor.h"
#import "GTFormSectionDescriptor.h"

// Categories
#import "NSArray+GTFormAdditions.h"
#import "NSExpression+GTFormAdditions.h"
#import "NSObject+GTFormAdditions.h"
#import "NSPredicate+GTFormAdditions.h"
#import "NSString+GTFormAdditions.h"
#import "UIView+GTFormAdditions.h"
#import "UIView+GTFrame.h"

//helpers
#import "GTFormOptionsObject.h"
#import "GTFormTool.h"

//Controllers
#import "GTFormOptionsViewController.h"
#import "GTFormViewController.h"

//Protocols
#import "GTFormDescriptorCell.h"
#import "GTFormInlineRowDescriptorCell.h"
#import "GTFormRowDescriptorViewController.h"

//Cells
#import "GTFormBaseCell.h"
#import "GTFormStaticCell.h"
#import "GTFormButtonCell.h"
#import "GTFormCheckCell.h"
#import "GTFormDateCell.h"
#import "GTFormDatePickerCell.h"
#import "GTFormInlineSelectorCell.h"
#import "GTFormLeftRightSelectorCell.h"
#import "GTFormPickerCell.h"
#import "GTFormRightDetailCell.h"
#import "GTFormRightImageButton.h"
#import "GTFormSegmentedCell.h"
#import "GTFormSelectorCell.h"
#import "GTFormSliderCell.h"
#import "GTFormStepCounterCell.h"
#import "GTFormSwitchCell.h"
#import "GTFormTextFieldCell.h"
#import "GTFormTextViewCell.h"
#import "GTFormImageCell.h"

//Validation
#import "GTFormRegexValidator.h"


extern NSString *const GTFormRowDescriptorTypeAccount;
extern NSString *const GTFormRowDescriptorTypeBooleanCheck;
extern NSString *const GTFormRowDescriptorTypeBooleanSwitch;
extern NSString *const GTFormRowDescriptorTypeButton;
extern NSString *const GTFormRowDescriptorTypeCountDownTimer;
extern NSString *const GTFormRowDescriptorTypeCountDownTimerInline;
extern NSString *const GTFormRowDescriptorTypeDate;
extern NSString *const GTFormRowDescriptorTypeDateInline;
extern NSString *const GTFormRowDescriptorTypeDatePicker;
extern NSString *const GTFormRowDescriptorTypeDateTime;
extern NSString *const GTFormRowDescriptorTypeDateTimeInline;
extern NSString *const GTFormRowDescriptorTypeDecimal;
extern NSString *const GTFormRowDescriptorTypeEmail;
extern NSString *const GTFormRowDescriptorTypeImage;
extern NSString *const GTFormRowDescriptorTypeInfo;
extern NSString *const GTFormRowDescriptorTypeInteger;
extern NSString *const GTFormRowDescriptorTypeMultipleSelector;
extern NSString *const GTFormRowDescriptorTypeMultipleSelectorPopover;
extern NSString *const GTFormRowDescriptorTypeName;
extern NSString *const GTFormRowDescriptorTypeNumber;
extern NSString *const GTFormRowDescriptorTypePassword;
extern NSString *const GTFormRowDescriptorTypePhone;
extern NSString *const GTFormRowDescriptorTypePicker;
extern NSString *const GTFormRowDescriptorTypeSelectorActionSheet;
extern NSString *const GTFormRowDescriptorTypeSelectorAlertView;
extern NSString *const GTFormRowDescriptorTypeSelectorLeftRight;
extern NSString *const GTFormRowDescriptorTypeSelectorPickerView;
extern NSString *const GTFormRowDescriptorTypeSelectorPickerViewInline;
extern NSString *const GTFormRowDescriptorTypeSelectorPopover;
extern NSString *const GTFormRowDescriptorTypeSelectorPush;
extern NSString *const GTFormRowDescriptorTypeSelectorSegmentedControl;
extern NSString *const GTFormRowDescriptorTypeSlider;
extern NSString *const GTFormRowDescriptorTypeStepCounter;
extern NSString *const GTFormRowDescriptorTypeText;
extern NSString *const GTFormRowDescriptorTypeTextView;
extern NSString *const GTFormRowDescriptorTypeTime;
extern NSString *const GTFormRowDescriptorTypeTimeInline;
extern NSString *const GTFormRowDescriptorTypeTwitter;
extern NSString *const GTFormRowDescriptorTypeURL;
extern NSString *const GTFormRowDescriptorTypeZipCode;
extern NSString *const GTFormRowDescriptorTypeStatic;



#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending


