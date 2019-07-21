//
//  UIView+Additions.h
//  HuoMao
//
//  Created by HuoMaoTV on 15/1/20.
//  Copyright (c) 2015年 woo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

/** 展示加载转圈 */
@property (nonatomic, assign) BOOL showActivityIndicator;

// 通过响应者链获取视图控制器
- (UIViewController *)viewController;
- (void)shakeToShowView;

@end
