//
//  UIView+RedPoint.h
//  HMStaticLibrary
//
//  Created by claudechoi on 2018/8/29.
//  Copyright © 2018年 huomao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RedPoint)
/** icon右上角红点 */
@property (nonatomic, assign) BOOL showRedPoint;
/** 默认右上角红点 */
@property (nonatomic, assign) BOOL showRightTopRedPoint;
/** 默认右上角文字 */
@property (nonatomic, copy) NSString *rightTopTitle;

@end
