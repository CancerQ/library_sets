//
//  UITextField+YZAdd.h
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/31.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `UITextField`.
 */
@interface UITextField (YZAdd)

/**
 Set all text selected.
 */
- (void)yz_selectAllText;

/**
 Set text in range selected.
 
 @param range  The range of selected text in a document.
 */
- (void)yz_setSelectedRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
