//
//  UIView+CurrentController.h
//  HMStaticLibrary
//
//  Created by lijunfeng on 2018/8/28.
//  Copyright © 2018年 huomao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CurrentViewController)

/**
 获取当前View的控制器对象####如果控制器存在则返回<UIViewController>,否则返回nil####
 @return 如果控制器存在则返回<UIViewController>,否则返回nil
 */
- (UIViewController *)getCurrentViewController;

@end
