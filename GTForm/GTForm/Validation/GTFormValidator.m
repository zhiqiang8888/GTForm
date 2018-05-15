//
//  GTFormValidator.h
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

#import "GTFormValidationStatus.h"
#import "GTFormRegexValidator.h"

#import "GTFormValidator.h"

@implementation GTFormValidator

-(GTFormValidationStatus *)isValid:(GTFormRowDescriptor *)row
{
    return [GTFormValidationStatus formValidationStatusWithMsg:nil status:YES rowDescriptor:row];
}

#pragma mark - Validators


+(GTFormValidator *)emailValidator
{
    return [GTFormRegexValidator formRegexValidatorWithMsg:NSLocalizedString(@"Invalid email address", nil) regex:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}
+(GTFormValidator *)emailValidatorLong
{
    return [GTFormRegexValidator formRegexValidatorWithMsg:NSLocalizedString(@"Invalid email address", nil) regex:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,11}"];
}
@end
