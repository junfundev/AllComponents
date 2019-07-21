//
//  UIView+Shadow.h
//  Shadow Maker Example
//
//  Created by Philip Yu on 5/14/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSUInteger, OutsideShadowDirection) {
    OutsideShadowDirectionTop,
    OutsideShadowDirectionLeft,
    OutsideShadowDirectionBottom,
    OutsideShadowDirectionRight,
};

@interface UIView (Shadow)

- (void) makeInsetShadow;
- (void) makeInsetShadowWithRadius:(float)radius Alpha:(float)alpha;
- (void) makeInsetShadowWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions;

/** 应该设置一个全局的弹层边缘阴影方法 */
- (void) makeOutsideShadowWithDirection:(OutsideShadowDirection)direction;

@end
