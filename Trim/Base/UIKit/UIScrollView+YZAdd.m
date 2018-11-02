//
//  UIScrollView+YZAdd.m
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/31.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "UIScrollView+YZAdd.h"
#import "YZTirmMacro.h"

YZSYNTH_DUMMY_CLASS(UIScrollView_YZAdd)


@implementation UIScrollView (YZAdd)

- (void)yz_scrollToTop {
    [self yz_scrollToTopAnimated:YES];
}

- (void)yz_scrollToBottom {
    [self yz_scrollToBottomAnimated:YES];
}

- (void)yz_scrollToLeft {
    [self yz_scrollToLeftAnimated:YES];
}

- (void)yz_scrollToRight {
    [self yz_scrollToRightAnimated:YES];
}

- (void)yz_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)yz_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)yz_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)yz_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
