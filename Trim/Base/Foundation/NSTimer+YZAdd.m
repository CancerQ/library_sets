//
//  NSTimer+YZAdd.m
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/30.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "NSTimer+YZAdd.h"
#import "YZTirmMacro.h"

YZSYNTH_DUMMY_CLASS(NSTimer_YZAdd)


@implementation NSTimer (YZAdd)

+ (void)_yz_ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)yz_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(_yz_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)yz_timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats {
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(_yz_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

@end
