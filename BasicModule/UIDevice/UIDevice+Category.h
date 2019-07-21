//
//  UIDevice+Category.h
//  lawyer
//
//  Created by ZH on 2018/4/26.
//  Copyright © 2018年 ZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Category)


/**
 获取设备标识符
 */
- (NSString *)machineModel;


/**
 获取设备名称
 */
- (NSString *)machineModelName;


/**
 获取APP版本号
 */
+ (NSString *)appVersion;


/**
 获取APP Bundle 版本号
 */
+ (NSString*)appBundleVersion;


/**
 获取设备APP标识符
 */
+ (NSString *)appBundleIdentifier;
@end
