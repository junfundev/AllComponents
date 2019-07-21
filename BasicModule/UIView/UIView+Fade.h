//
//  UIView+Fade.h
//  HMStaticLibrary
//
//  Created by lijunfeng on 2018/11/27.
//  Copyright © 2018 huomao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Fade)

- (UIView *)fadeShow;
- (void)fadeOut:(NSTimeInterval)delay;
- (void)cancelFadeOut;

@end
