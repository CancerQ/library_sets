//
//  UITextField+YZAdd.m
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/31.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "UITextField+YZAdd.h"
#import "YZTirmMacro.h"

YZSYNTH_DUMMY_CLASS(UITextField_YZAdd)


@implementation UITextField (YZAdd)

- (void)yz_selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)yz_setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

@end
