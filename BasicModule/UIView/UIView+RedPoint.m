//
//  UIView+RedPoint.m
//  HMStaticLibrary
//
//  Created by claudechoi on 2018/8/29.
//  Copyright © 2018年 huomao. All rights reserved.
//

#import "UIView+RedPoint.h"
#import "HMDefines.h"
#import "HMToolKit.h"
#import <objc/runtime.h>
#import "UIFont+Extention.h"
#import "UIView+Extension.h"

static NSString *const redPointKey = @"redPointKey";

static NSString *const rightTopRedPointKey = @"rightTopRedPointKey";

static NSString *const rightTopKey = @"rightTopKey";

NSInteger const redPointTag = 188291939;

NSInteger const rightTopRedPointTag = 189291103;

NSInteger const rightTopTag = 189282128;

@implementation UIView (RedPoint)

- (void)setShowRedPoint:(BOOL)showRedPoint {
    if (showRedPoint) {
        UIView *redPointView = [self viewWithTag:redPointTag];
        if (redPointView) {
            objc_setAssociatedObject(self, &redPointKey, @(showRedPoint), OBJC_ASSOCIATION_ASSIGN);
            return;
        }
        CGFloat centerXY = CGRectGetHeight(self.frame)*0.5;
        CGPoint centerPoint = CGPointMake(centerXY, centerXY);
        CGFloat radius = centerXY - 2;
        CGPoint point = HMGetCircleRadiusPoint(centerPoint, radius, -M_PI_4);
        redPointView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        redPointView.center = point;
        redPointView.backgroundColor = UIColorFromRGB(0xFF351C);
        redPointView.layer.cornerRadius = 5;
        redPointView.layer.borderColor = [UIColor whiteColor].CGColor;
        redPointView.layer.borderWidth = 1;
        redPointView.tag = redPointTag;
        [self addSubview:redPointView];
    } else {
        UIView *redPointView = [self viewWithTag:redPointTag];
        if (redPointView) {
            [redPointView removeFromSuperview];
        }
    }
    objc_setAssociatedObject(self, &redPointKey, @(showRedPoint), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)showRedPoint {
    return objc_getAssociatedObject(self, &redPointKey);
}

- (void)setShowRightTopRedPoint:(BOOL)showRightTopRedPoint {
    if (showRightTopRedPoint) {
        UIView *redPointView = [self viewWithTag:rightTopRedPointTag];
        if (redPointView) {
            objc_setAssociatedObject(self, &rightTopRedPointKey, @(showRightTopRedPoint), OBJC_ASSOCIATION_ASSIGN);
            return;
        }
        CGPoint point = CGPointMake(CGRectGetWidth(self.frame), 0);
        redPointView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        redPointView.center = point;
        redPointView.backgroundColor = UIColorFromRGB(0xFF351C);
        redPointView.layer.cornerRadius = 5;
        redPointView.layer.borderColor = [UIColor whiteColor].CGColor;
        redPointView.layer.borderWidth = 1;
        redPointView.tag = rightTopRedPointTag;
        [self addSubview:redPointView];
    } else {
        UIView *redPointView = [self viewWithTag:rightTopRedPointTag];
        if (redPointView) {
            [redPointView removeFromSuperview];
        }
    }
    objc_setAssociatedObject(self, &rightTopRedPointKey, @(showRightTopRedPoint), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)showRightTopRedPoint {
    return objc_getAssociatedObject(self, &rightTopRedPointKey);
}

- (void)setRightTopTitle:(NSString *)rightTopTitle {
    if (rightTopTitle && rightTopTitle.length > 0) {
        UILabel *label = [self viewWithTag:rightTopTag];
        if (label) {
            objc_setAssociatedObject(self, &redPointKey, rightTopTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            return;
        }
        CGPoint point = CGPointMake(CGRectGetWidth(self.frame), 0);
        UIFont *font = [UIFont pingFangRegularFontWithSize:10];
        CGSize size = HMGetTextSize(rightTopTitle, font, 40);
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width + 10, size.height)];
        label.text = rightTopTitle;
        label.font = font;
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = UIColorFromRGB(0xF05B3D);
        label.allCornerRadius = label.frame.size.height*0.5;
        label.center = point;
        label.tag = rightTopTag;
        [self addSubview:label];
    } else {
        UIView *label = [self viewWithTag:rightTopTag];
        if (label) {
            [label removeFromSuperview];
        }
    }
    objc_setAssociatedObject(self, &redPointKey, rightTopTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)rightTopTitle {
    return objc_getAssociatedObject(self, &rightTopKey);
}

@end
