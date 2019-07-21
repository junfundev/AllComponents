//
//  NSObject+WakeUpMainThread.m
//  HMStaticLibrary
//
//  Created by lijunfeng on 2018/12/24.
//  Copyright © 2018 huomao. All rights reserved.
//

#import "NSObject+WakeUpMainThread.h"

@implementation NSObject (WakeUpMainThread)

- (void)wakeUpMainThread_HM {
    [self performSelector:@selector(_wakeupSleepThreadForHM) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
}

- (void)_wakeupSleepThreadForHM {
#if DEBUG
    NSLog(@"这个方法什么都不需要做，只是为了唤醒主线程");
#endif
}

@end
