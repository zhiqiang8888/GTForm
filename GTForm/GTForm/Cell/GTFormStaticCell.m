//
//  GTFormStaticCell.m
//  GTTableView
//
//  Created by liuxc on 2018/5/15.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "GTFormStaticCell.h"
#import "GTFormStaticRowDescriptor.h"
#import "GTForm.h"

@interface GTFormStaticCell()
{
    UIImageView *_arrowImageView;
    UISwitch *_switch;
}

@property (nonatomic, strong) GTFormStaticRowDescriptor *staticRowDescriptor;

@end

@implementation GTFormStaticCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
}

- (void)configure
{
    [super configure];
    [self setupData];
}


- (void)update
{
    [super update];
    [self setupData];
}

- (void)setupData {

    if (self.staticRowDescriptor.backgroundColor) {
        UIView *backgroundView = [UIView new];
        backgroundView.backgroundColor = self.staticRowDescriptor.backgroundColor;
        self.backgroundView = backgroundView;
    }

    if (self.staticRowDescriptor.selectBackgroundColor) {
        UIView *selectedBackgroundView = [UIView new];
        selectedBackgroundView.backgroundColor = self.staticRowDescriptor.selectBackgroundColor;
        self.selectedBackgroundView = selectedBackgroundView;
    }

    if (self.staticRowDescriptor.iconImage) {
        self.imageView.image = self.staticRowDescriptor.iconImage;
    }else if (self.staticRowDescriptor.icon && ![self.staticRowDescriptor.icon isEqualToString:@""]) {
        // 判断是否是网络图片
        if ([self.staticRowDescriptor.icon hasPrefix:@"http"]) {
            // 使用时需要加入SDWebImage
//          [self.imageView sd_setImageWithURL:[NSURL URLWithString:staticRowDescriptor.icon]];
        }else {
            self.imageView.image = [UIImage imageNamed:self.staticRowDescriptor.icon];
        }
    }else {
        self.imageView.image = nil;
    }

    self.textLabel.text       = self.staticRowDescriptor.title;
    self.detailTextLabel.text = self.staticRowDescriptor.detailTitle;

    self.detailTextLabel.numberOfLines = self.staticRowDescriptor.fixedWidth ? 0 : 1;

    if (self.staticRowDescriptor.textFont) {
        self.textLabel.font = self.staticRowDescriptor.textFont;
    }else {
        self.textLabel.font = [UIFont systemFontOfSize:17.0];
    }

    if (self.staticRowDescriptor.detailTextFont) {
        self.detailTextLabel.font = self.staticRowDescriptor.textFont;
    }else {
        self.detailTextLabel.font = [UIFont systemFontOfSize:17.0];
    }

    if (self.staticRowDescriptor.textColor && !self.staticRowDescriptor.isDisabled) {
        self.textLabel.textColor = self.staticRowDescriptor.textColor;
    }else  {
        self.textLabel.textColor  = self.staticRowDescriptor.isDisabled ? [UIColor grayColor] : [UIColor blackColor];
    }

    if (self.staticRowDescriptor.detailTextColor) {
        self.detailTextLabel.textColor = self.staticRowDescriptor.detailTextColor;
    }else {
        self.detailTextLabel.textColor = [UIColor colorWithRed:0.556863 green:0.556863 blue:0.576471 alpha:1.0];
    }

    switch (self.staticRowDescriptor.staticStyle) {
        case GTFormStaticTypeIcon:
            [self setupIconItem];
            break;
        case GTFormStaticTypeArrow:
            [self setupArrowItem];
            break;
        case GTFormStaticTypeSwitch:
            [self setupSwitchItem];
            break;
        default:
            [self setupNormalItem];
            break;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.imageView.image) {
        self.imageView.frame = CGRectZero;
    }

    if (!self.textLabel.text || [self.textLabel.text isEqualToString:@""]) {
        self.textLabel.frame = CGRectZero;
    }

    [self setupTitleFrames];

    switch (self.staticRowDescriptor.staticStyle) {
        case GTFormStaticTypeIcon:
            [self setupIconFrames];
            break;
        case GTFormStaticTypeArrow:
            [self setupArrowFrames];
            break;
        case GTFormStaticTypeSwitch:
            [self setupDetailFrames];
            break;
        case GTFormStaticTypeExit:
            self.textLabel.center = self.contentView.center;
            break;
        default:
            [self setupDetailFrames];
            break;
    }

    // 设置分割线的frame
    [self setupSeparactorFrames];
}

#pragma mark - update frames
- (void)setupTitleFrames {
    [self.textLabel sizeToFit];
    self.textLabel.left = self.imageView.right + self.staticRowDescriptor.textSpace;
}

- (void)setupDetailFrames {
    self.detailTextLabel.hidden = NO;
    [self.detailTextLabel sizeToFit];

    switch (self.staticRowDescriptor.detailStyle) {
        case GTFormStaticDetailStyleNone:
            self.detailTextLabel.hidden = YES;
            break;
        case GTFormStaticDetailStyleRight:
            if (self.staticRowDescriptor.staticStyle == GTFormStaticTypeArrow) {
                self.detailTextLabel.right = self.staticRowDescriptor.hideArrow ? self.width - 15 : self.contentView.right;
            }else {
                if (self.accessoryView == nil || self.accessoryType == UITableViewCellAccessoryNone) {
                    self.detailTextLabel.right = self.contentView.right - 15;
                }else {
                    self.detailTextLabel.right = self.contentView.right;
                }
            }
            break;
        case GTFormStaticDetailStyleBottom:
            self.textLabel.top          = 2;
            self.detailTextLabel.bottom = self.height - 2;
            self.detailTextLabel.left   = self.textLabel.left;
            break;
        default:
            break;
    }

    CGSize detailTextLabelSize = [self.detailTextLabel.text  GTForm_sizeWithFont:self.detailTextLabel.font maxWidth:self.detailTextLabel.width maxHeight:CGFLOAT_MAX];
    if (self.staticRowDescriptor.fixedWidth) {
        self.staticRowDescriptor.height = MAX(detailTextLabelSize.height + 30, 44);
    }
}


- (void)setupArrowFrames {
    [self setupDetailFrames];
}

- (void)setupIconFrames {
    self.imageView.size    = self.staticRowDescriptor.iconSize;
    self.imageView.centerY = self.height * 0.5;

    [self setupDetailFrames];

    switch (self.staticRowDescriptor.iconStyle) {
        case GTFormStaticIconStyleLeft:
            if (self.staticRowDescriptor.detailStyle == GTFormStaticDetailStyleBottom) {
                self.textLabel.top = self.imageView.top + 5;
                self.detailTextLabel.bottom = self.imageView.bottom - 5;
            }
            self.textLabel.left = self.imageView.right + self.staticRowDescriptor.textSpace;
            self.detailTextLabel.left = self.textLabel.left;
            break;
        case GTFormStaticIconStyleCenter:
            self.textLabel.left = self.staticRowDescriptor.textSpace;
            if (self.staticRowDescriptor.detailStyle == GTFormStaticDetailStyleCenter) {
                self.detailTextLabel.left = self.textLabel.left;
            }
            if (!self.textLabel.text || [self.textLabel.text isEqualToString:@""]) {
                self.imageView.left = 15;
            }else {
                self.imageView.left = self.textLabel.right + 10;
            }
            break;
        case GTFormStaticIconStyleRight:
            self.textLabel.left = self.staticRowDescriptor.textSpace;

            self.imageView.right = self.staticRowDescriptor.hideArrow ? self.width - 15 : self.contentView.right;

            if (self.staticRowDescriptor.detailStyle == GTFormStaticDetailStyleCenter) {
                self.detailTextLabel.left = self.textLabel.left;
            }else if (self.staticRowDescriptor.detailStyle == GTFormStaticDetailStyleRight) {
                self.detailTextLabel.hidden = YES;
            }

        default:
            break;
    }

}

- (void)setupSeparactorFrames {
    // 最后一个不作处理
    if (self.indexPath.row == self.staticRowDescriptor.sectionDescriptor.formRows.count - 1) {

    }else { //_UITableViewCellSeparatorView
        __block UIView *separatorView = nil;
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSClassFromString(@"_UITableViewCellSeparatorView")]) {
                if (obj.top != 0) {
                    separatorView = obj;
                }
            }
        }];
        if (separatorView) {
            switch (self.staticRowDescriptor.separatorAlignType) {
                case GTFormStaticCellSeparatorAlignTypeText:
                {
                    separatorView.left  = self.textLabel.left;
                    separatorView.width = self.width - self.textLabel.left;
                }
                    break;
                case GTFormStaticCellSeparatorAlignTypeImage:
                {
                    if (self.imageView.image) {
                        separatorView.left = self.imageView.left;
                    }else {
                        separatorView.left = self.textLabel.left;
                    }

                    separatorView.width = self.width - separatorView.left;
                }
                    break;
                case GTFormStaticCellSeparatorAlignTypeCell:
                {
                    separatorView.left  = 0;
                    separatorView.width = self.width;
                }
                    break;
                default:
                    break;
            }
        }
    }
}



#pragma mark - Private Methods
- (void)setupNormalItem {
    self.accessoryView  = nil;
    self.accessoryType  = UITableViewCellAccessoryNone;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setupIconItem {
    [self setupArrowItem];

    self.imageView.layer.cornerRadius  = self.staticRowDescriptor.iconCornerRadius;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderColor   = self.staticRowDescriptor.iconBorderColor.CGColor;
    self.imageView.layer.borderWidth   = self.staticRowDescriptor.iconBorderWidth;
}

- (void)setupArrowItem {
    if (self.staticRowDescriptor.hideArrow) {
        self.accessoryView = nil;
        _arrowImageView    = nil;
        self.accessoryType = UITableViewCellAccessoryNone;
    }else {
        if (self.staticRowDescriptor.arrowImage) {
            _arrowImageView = [[UIImageView alloc] initWithImage:self.staticRowDescriptor.arrowImage];
            self.accessoryView = _arrowImageView;
        }else {
            _arrowImageView    = nil;
            self.accessoryView = nil;
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }

    self.selectionStyle = UITableViewCellSelectionStyleDefault;
}

- (void)setupSwitchItem {

    if (!_switch) {
        _switch = [[UISwitch alloc] init];
        [_switch addTarget:self action:@selector(switchValueChanged) forControlEvents:UIControlEventValueChanged];
    }

    _switch.on = self.staticRowDescriptor.open;

    self.accessoryView  = _switch;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)switchValueChanged {
    self.staticRowDescriptor.open = _switch.on;

    !self.staticRowDescriptor.switchChangeBlock ? : self.staticRowDescriptor.switchChangeBlock(self.staticRowDescriptor.open);
}


#pragma mark - set/get
- (GTFormStaticRowDescriptor *)staticRowDescriptor {
    return (GTFormStaticRowDescriptor *)self.rowDescriptor;
}


#pragma mark - 点击跳转
-(void)formDescriptorCellDidSelectedWithFormController:(GTFormViewController *)controller
{
    if (self.rowDescriptor.action.formBlock){
        self.rowDescriptor.action.formBlock(self.rowDescriptor);
    }
    else if (self.rowDescriptor.action.formSelector){
        [controller performFormSelector:self.rowDescriptor.action.formSelector withObject:self.rowDescriptor];
    }
    else if ([self.rowDescriptor.action.formSegueIdentifier length] != 0){
        [controller performSegueWithIdentifier:self.rowDescriptor.action.formSegueIdentifier sender:self.rowDescriptor];
    }
    else if (self.rowDescriptor.action.formSegueClass){
        UIViewController * controllerToPresent = [self controllerToPresent];
        NSAssert(controllerToPresent, @"either rowDescriptor.action.viewControllerClass or rowDescriptor.action.viewControllerStoryboardId or rowDescriptor.action.viewControllerNibName must be assigned");
        UIStoryboardSegue * segue = [[self.rowDescriptor.action.formSegueClass alloc] initWithIdentifier:self.rowDescriptor.tag source:controller destination:controllerToPresent];
        [controller prepareForSegue:segue sender:self.rowDescriptor];
        [segue perform];
    }
    else{
        UIViewController * controllerToPresent = [self controllerToPresent];
        if (controllerToPresent){
            if ([controllerToPresent conformsToProtocol:@protocol(GTFormRowDescriptorViewController)]){
                ((UIViewController<GTFormRowDescriptorViewController> *)controllerToPresent).rowDescriptor = self.rowDescriptor;
            }
            if (controller.navigationController == nil || [controllerToPresent isKindOfClass:[UINavigationController class]] || self.rowDescriptor.action.viewControllerPresentationMode == GTFormPresentationModePresent){
                [controller presentViewController:controllerToPresent animated:YES completion:nil];
            }
            else{
                [controller.navigationController pushViewController:controllerToPresent animated:YES];
            }
        }

    }
}


#pragma mark - Helpers

-(UIViewController *)controllerToPresent
{
    if (self.rowDescriptor.action.viewControllerClass){
        return [[self.rowDescriptor.action.viewControllerClass alloc] init];
    }
    else if ([self.rowDescriptor.action.viewControllerStoryboardId length] != 0){
        UIStoryboard * storyboard =  [self storyboardToPresent];
        NSAssert(storyboard != nil, @"You must provide a storyboard when rowDescriptor.action.viewControllerStoryboardId is used");
        return [storyboard instantiateViewControllerWithIdentifier:self.rowDescriptor.action.viewControllerStoryboardId];
    }
    else if ([self.rowDescriptor.action.viewControllerNibName length] != 0){
        Class viewControllerClass = NSClassFromString(self.rowDescriptor.action.viewControllerNibName);
        NSAssert(viewControllerClass, @"class owner of self.rowDescriptor.action.viewControllerNibName must be equal to %@", self.rowDescriptor.action.viewControllerNibName);
        return [[viewControllerClass alloc] initWithNibName:self.rowDescriptor.action.viewControllerNibName bundle:nil];
    }
    return nil;
}

-(UIStoryboard *)storyboardToPresent
{
    if ([self.formViewController respondsToSelector:@selector(storyboardForRow:)]){
        return [self.formViewController storyboardForRow:self.rowDescriptor];
    }
    if (self.formViewController.storyboard){
        return self.formViewController.storyboard;
    }
    return nil;
}

@end
