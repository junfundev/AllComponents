//
//  UIView+CurrentController.m
//  HMStaticLibrary
//
//  Created by lijunfeng on 2018/8/28.
//  Copyright © 2018年 huomao. All rights reserved.
//

#import "UIView+CurrentController.h"

@implementation UIView (CurrentViewController)

/** 获取当前View的控制器对象 */
- (UIViewController *)getCurrentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}

@end
