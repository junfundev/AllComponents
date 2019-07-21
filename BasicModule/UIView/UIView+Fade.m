//
//  UIView+Fade.m
//  HMStaticLibrary
//
//  Created by lijunfeng on 2018/11/27.
//  Copyright © 2018 huomao. All rights reserved.
//

#import "UIView+Fade.h"
#import <objc/runtime.h>


@implementation UIView (Fade)

- (NSNumber *)fadeSeeds{
    return objc_getAssociatedObject(self, @selector(fadeSeeds));
}

- (void)setFadeSeeds:(NSNumber *)seeds{
    objc_setAssociatedObject(self, @selector(fadeSeeds), seeds, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)cancelFadeOut
{
    [self setFadeSeeds:@(arc4random_uniform(1000))];
}

- (UIView *)fadeShow
{
    [self cancelFadeOut];
    [UIView animateWithDuration:0.2 delay:UIViewAnimationOptionCurveEaseIn options:0 animations:^{
        self.hidden = NO;
    } completion:^(BOOL finished) {
        
    }];
    return self;
}

- (void)fadeOut:(NSTimeInterval)delay
{
    int seeds = [self.fadeSeeds intValue];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (seeds == [self.fadeSeeds intValue]) {
            [UIView animateWithDuration:0.2 delay:UIViewAnimationOptionCurveEaseOut options:0 animations:^{
                self.hidden = YES;
            } completion:^(BOOL finished) {
                
            }];
            [self cancelFadeOut];
        }
    });
}


@end