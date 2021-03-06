//
//  GTFormLeftRightSelectorCell.m
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

#import "UIView+GTFormAdditions.h"
#import "GTFormRightImageButton.h"
#import "NSObject+GTFormAdditions.h"
#import "GTFormLeftRightSelectorCell.h"

@implementation GTFormLeftRightSelectorCell
{
    UITextField * _constraintTextField;
}


@synthesize leftButton = _leftButton;
@synthesize rightLabel = _rightLabel;


#pragma mark - Properties

-(UIButton *)leftButton
{
    if (_leftButton) return _leftButton;
    _leftButton = [[GTFormRightImageButton alloc] init];
    [_leftButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GTForm.bundle/forwardarrow.png"]];
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_leftButton addSubview:imageView];
    [_leftButton addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[image(8)]|" options:0 metrics:0 views:@{@"image": imageView}]];
    
    UIView * separatorTop = [UIView autolayoutView];
    UIView * separatorBottom = [UIView autolayoutView];
    [_leftButton addSubview:separatorTop];
    [_leftButton addSubview:separatorBottom];
    [_leftButton addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[separatorTop(separatorBottom)][image][separatorBottom]|" options:0 metrics:0 views:@{@"image": imageView, @"separatorTop": separatorTop, @"separatorBottom": separatorBottom}]];
    _leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15);
    
    [_leftButton setTitleColor:[UIColor colorWithRed:0.0 green:0.478431 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [_leftButton setContentHuggingPriority:500 forAxis:UILayoutConstraintAxisHorizontal];

    return _leftButton;
}

-(UILabel *)rightLabel
{
    if (_rightLabel) return _rightLabel;
    _rightLabel = [UILabel autolayoutView];
    [_rightLabel setTextColor:[UIColor grayColor]];
    [_rightLabel setTextAlignment:NSTextAlignmentRight];
    return _rightLabel;
}


-(GTFormLeftRightSelectorOption *)leftOptionForDescription:(NSString *)description
{
    if (description){
        return [[self.rowDescriptor.selectorOptions filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            return ([description isEqual:[((GTFormLeftRightSelectorOption *)evaluatedObject).leftValue displayText]]);
        }]] firstObject];
    }
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"" userInfo:nil];
}

-(GTFormLeftRightSelectorOption *)leftOptionForOption:(id)option
{
    if (option){
        return [[self.rowDescriptor.selectorOptions filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
            GTFormLeftRightSelectorOption * evaluatedLeftOption = (GTFormLeftRightSelectorOption *)evaluatedObject;
            return [evaluatedLeftOption.leftValue isEqual:option];
        }]] firstObject];
    }
    @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"" userInfo:nil];
}




#pragma mark - GTFormDescriptorCell

-(void)configure
{
    [super configure];
    UIView * separatorView = [UIView autolayoutView];
    _constraintTextField = [UITextField autolayoutView];
    [_constraintTextField setText:@"Option"];
    _constraintTextField.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [separatorView setBackgroundColor:[UIColor colorWithWhite:0.85 alpha:1.0]];
    [self.contentView addSubview:_constraintTextField];
    [_constraintTextField setHidden:YES];
    [self.contentView addSubview:self.leftButton];
    [self.contentView addSubview:self.rightLabel];
    [self.contentView addSubview:separatorView];
    [self.leftButton addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary * views = @{@"leftButton" : self.leftButton, @"rightLabel": self.rightLabel, @"separatorView": separatorView, @"constraintTextField": _constraintTextField };
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[constraintTextField]" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[leftButton]-[separatorView(1)]-[rightLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[separatorView(20)]" options:0 metrics:nil views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[constraintTextField]-12-|" options:0 metrics:0 views:views]];
}

-(void)update
{
    [super update];
    self.leftButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.rightLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [self.leftButton setTitle:[NSString stringWithFormat:@"%@%@", [self.rowDescriptor.leftRightSelectorLeftOptionSelected displayText], self.rowDescriptor.required && self.rowDescriptor.sectionDescriptor.formDescriptor.addAsteriskToRequiredRowsTitle ? @"*" : @""] forState:UIControlStateNormal];
    [self.rowDescriptor setTitle:[self.rowDescriptor.leftRightSelectorLeftOptionSelected displayText]];
    self.rightLabel.text = [self rightTextLabel];
    [self.leftButton setEnabled:!self.rowDescriptor.isDisabled];
    self.accessoryView = self.rowDescriptor.isDisabled ? nil : [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GTForm.bundle/forwardarrow.png"]];
    self.editingAccessoryView = self.accessoryView;
    self.selectionStyle = self.rowDescriptor.isDisabled ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
}


-(NSString *)rightTextLabel
{
    return (self.rowDescriptor.value ? [self.rowDescriptor.value displayText] : (self.rowDescriptor.leftRightSelectorLeftOptionSelected ? [self leftOptionForOption:self.rowDescriptor.leftRightSelectorLeftOptionSelected].noValueDisplayText : @""));
}


-(void)formDescriptorCellDidSelectedWithFormController:(GTFormViewController *)controller
{
    if (self.rowDescriptor.leftRightSelectorLeftOptionSelected){
        GTFormLeftRightSelectorOption * option = [self leftOptionForOption:self.rowDescriptor.leftRightSelectorLeftOptionSelected];
        if (option.rightOptions){
            GTFormOptionsViewController * optionsViewController = [[GTFormOptionsViewController alloc]  initWithStyle:UITableViewStyleGrouped];
            optionsViewController.title = option.selectorTitle;
            optionsViewController.rowDescriptor = self.rowDescriptor;
            [controller.navigationController pushViewController:optionsViewController animated:YES];
        }
        else{
            GTFormLeftRightSelectorOption * option = [self leftOptionForOption:self.rowDescriptor.leftRightSelectorLeftOptionSelected];
            Class selectorClass =  option.rightSelectorControllerClass;
            UIViewController<GTFormRowDescriptorViewController> *selectorViewController = [[selectorClass alloc] init];
            selectorViewController.rowDescriptor = self.rowDescriptor;
            selectorViewController.title = self.rowDescriptor.selectorTitle;
            [controller.navigationController pushViewController:selectorViewController animated:YES];
        }
    }
}

-(NSString *)formDescriptorHttpParameterName
{
    GTFormLeftRightSelectorOption * option = [self leftOptionForOption:self.rowDescriptor.leftRightSelectorLeftOptionSelected];
    return option.httpParameterKey;
}

- (id) chooseNewRightValueFromOption:(GTFormLeftRightSelectorOption*)option
{
    switch (option.leftValueChangePolicy) {
        case GTFormLeftRightSelectorOptionLeftValueChangePolicyChooseLastOption:
            return [option.rightOptions lastObject];
        case GTFormLeftRightSelectorOptionLeftValueChangePolicyChooseFirstOption:
            return [option.rightOptions firstObject];
        case GTFormLeftRightSelectorOptionLeftValueChangePolicyNullifyRightValue:
            return nil;
    }
    return nil;
}


#pragma mark - Actions


-(void)leftButtonPressed:(UIButton *)leftButton
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:self.rowDescriptor.selectorTitle
                                                                              message:nil
                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil)
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil]];
    __weak __typeof(self)weakSelf = self;
    for (GTFormLeftRightSelectorOption * leftOption in self.rowDescriptor.selectorOptions) {
        [alertController addAction:[UIAlertAction actionWithTitle:[leftOption.leftValue displayText]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              weakSelf.rowDescriptor.value = [self chooseNewRightValueFromOption:leftOption];
                                                              weakSelf.rowDescriptor.leftRightSelectorLeftOptionSelected = [self leftOptionForDescription:[leftOption.leftValue displayText]].leftValue;
                                                              [weakSelf.formViewController updateFormRow:weakSelf.rowDescriptor];
                                                          }]];
    }
    
    [self.formViewController presentViewController:alertController animated:YES completion:nil];
}

@end
