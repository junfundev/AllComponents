//
//  NSObject+WakeUpMainThread.h
//  HMStaticLibrary
//
//  Created by lijunfeng on 2018/12/24.
//  Copyright © 2018 huomao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WakeUpMainThread)

/**
 唤醒主线程：该方法是为了唤醒主线程立即执行presentViewController之类的方法
 这个方法什么都不需要做，只是为了唤醒主线程
 */
- (void)wakeUpMainThread_HM;

@end

NS_ASSUME_NONNULL_END
