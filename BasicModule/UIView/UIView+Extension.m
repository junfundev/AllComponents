//
//  UIView+Extension.m
//  HuoMao
//
//  Created by lijunfeng on 2018/2/2.
//  Copyright © 2018年 火猫. All rights reserved.
//

#define UIView_IsStrEmpty(_ref)    ((_ref == nil || _ref == NULL)||([_ref isEqual:@""])||([_ref isEqual:@"(null)"])||([_ref isEqual:@"null"])||([_ref isEqual:@" "])||([_ref isKindOfClass:[NSNull class]]))

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setAllCornerRadius:(CGFloat)allCornerRadius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:allCornerRadius];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (CGFloat)allCornerRadius {
    if (self.layer.mask) {
        return self.layer.mask.cornerRadius;
    }
    return self.layer.cornerRadius;
}

- (void)showAlertMsg:(NSString *)msg {
    if (!msg) { return; }
    NSString *msgStr = [NSString stringWithFormat:@"%@",msg];
    if (!UIView_IsStrEmpty(msgStr)) {
        [self hideToasts];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self makeToast:msgStr duration:2.5 position:CSToastPositionCenter];
        });
    }
}


- (void)showErrorMsgWithDictionary:(NSDictionary *)dict
{
    if (dict == nil) {
        return;
    }
    
    if (!(dict && [dict isKindOfClass:[NSDictionary class]])) {
        return;
    }
    
    if ([[dict allKeys] containsObject:@"message"]) {
        
        NSString *msg = [NSString stringWithFormat:@"%@",dict[@"message"]];
        
        [self showAlertMsg:msg];
    }
}


- (void)drawCornerRadiusWithRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:rectCorner
                                                         cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

// 获取当前的控制器
- (UIViewController *)getSuperVC {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
