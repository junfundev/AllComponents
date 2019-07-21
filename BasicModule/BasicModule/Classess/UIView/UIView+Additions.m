//
//  UIView+Additions.m
//  HuoMao
//
//  Created by HuoMaoTV on 15/1/20.
//  Copyright (c) 2015年 woo. All rights reserved.
//

#import "UIView+Additions.h"
#import <objc/runtime.h>

static NSString *const showActivityIndicatorKey = @"showActivityIndicatorKey";

NSInteger const showActivityIndicatorTag = 1811271500;

@implementation UIView (Additions)

- (void)setShowActivityIndicator:(BOOL)showActivityIndicator {
    if (showActivityIndicator) {
        UIActivityIndicatorView *indicator = [self viewWithTag:showActivityIndicatorTag];
        if (indicator) {
            objc_setAssociatedObject(self, &showActivityIndicatorKey, @(showActivityIndicator), OBJC_ASSOCIATION_ASSIGN);
            return;
        }
        indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        CGFloat indicatorW = CGRectGetWidth(indicator.frame);
        CGFloat indicatorH = CGRectGetHeight(indicator.frame);
        CGFloat indicatorX = (CGRectGetWidth(self.frame) - indicatorW) * 0.5;
        CGFloat indicatorY = (CGRectGetHeight(self.frame) - indicatorH) * 0.5;
        indicator.frame = CGRectMake(indicatorX, indicatorY, indicatorW, indicatorH);
        
        [self addSubview:indicator];
        indicator.tag = showActivityIndicatorTag;
        [indicator startAnimating];
    } else {
        UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)[self viewWithTag:showActivityIndicatorTag];
        if (indicator) {
            [indicator stopAnimating];
            [indicator removeFromSuperview];
        }
    }
    objc_setAssociatedObject(self, &showActivityIndicatorKey, @(showActivityIndicator), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)showActivityIndicator {
    return [objc_getAssociatedObject(self, &showActivityIndicatorKey) boolValue];
}

- (UIViewController *)viewController
{
    // 下一个响应者
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        } else {
            next = [next nextResponder];
        }
    } while (next != nil);
    
    return nil;
}

- (void)shakeToShowView {
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.3;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    [self.layer addAnimation:animation forKey:nil];
}


@end
