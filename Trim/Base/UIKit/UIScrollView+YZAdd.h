//
//  UIScrollView+YZAdd.h
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/31.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `UIScrollView`.
 */
@interface UIScrollView (YZAdd)

/**
 Scroll content to top with animation.
 */
- (void)yz_scrollToTop;

/**
 Scroll content to bottom with animation.
 */
- (void)yz_scrollToBottom;

/**
 Scroll content to left with animation.
 */
- (void)yz_scrollToLeft;

/**
 Scroll content to right with animation.
 */
- (void)yz_scrollToRight;

/**
 Scroll content to top.
 
 @param animated  Use animation.
 */
- (void)yz_scrollToTopAnimated:(BOOL)animated;

/**
 Scroll content to bottom.
 
 @param animated  Use animation.
 */
- (void)yz_scrollToBottomAnimated:(BOOL)animated;

/**
 Scroll content to left.
 
 @param animated  Use animation.
 */
- (void)yz_scrollToLeftAnimated:(BOOL)animated;

/**
 Scroll content to right.
 
 @param animated  Use animation.
 */
- (void)yz_scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
