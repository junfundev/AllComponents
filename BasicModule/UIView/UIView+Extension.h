//
//  UIView+Extension.h
//  HuoMao
//
//  Created by lijunfeng on 2018/2/2.
//  Copyright © 2018年 火猫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Toast.h"

@interface UIView (Extension)

/** 设置圆角 bezier */
@property (nonatomic, assign) CGFloat allCornerRadius;

/**
 显示提示语（默认2s，显示在中间）

 @param msg 提示语
 */
- (void)showAlertMsg:(NSString *)msg;

/**
 提示错误提示语 #结构：@{@"message":@""}#
 @param dict @{@"message":@""}
 */
- (void)showErrorMsgWithDictionary:(NSDictionary *)dict;


/**
 绘制圆角
 */
- (void)drawCornerRadiusWithRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii;

/**
 获取当前的控制器
 */
- (UIViewController *)getSuperVC;

@end
