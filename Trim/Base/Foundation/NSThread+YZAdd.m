//
//  NSThread+YZAdd.h
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/30.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "NSThread+YZAdd.h"
#import "YZTirmMacro.h"
#import <CoreFoundation/CoreFoundation.h>

YZSYNTH_DUMMY_CLASS(NSThread_YZAdd)

#if __has_feature(objc_arc)
#error This file must be compiled without ARC. Specify the -fno-objc-arc flag to this file.
#endif

static NSString *const YZNSThreadAutoleasePoolKey = @"YZNSThreadAutoleasePoolKey";
static NSString *const YZNSThreadAutoleasePoolStackKey = @"YZNSThreadAutoleasePoolStackKey";

static const void *PoolStackRetainCallBack(CFAllocatorRef allocator, const void *value) {
    return value;
}

static void PoolStackReleaseCallBack(CFAllocatorRef allocator, const void *value) {
    CFRelease((CFTypeRef)value);
}


static inline void YZAutoreleasePoolPush() {
    NSMutableDictionary *dic =  [NSThread currentThread].threadDictionary;
    NSMutableArray *poolStack = dic[YZNSThreadAutoleasePoolStackKey];
    
    if (!poolStack) {
        /*
         do not retain pool on push,
         but release on pop to avoid memory analyze warning
         */
        CFArrayCallBacks callbacks = {0};
        callbacks.retain = PoolStackRetainCallBack;
        callbacks.release = PoolStackReleaseCallBack;
        poolStack = (id)CFArrayCreateMutable(CFAllocatorGetDefault(), 0, &callbacks);
        dic[YZNSThreadAutoleasePoolStackKey] = poolStack;
        CFRelease(poolStack);
    }
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; // create
    [poolStack addObject:pool]; // push
}

static inline void YZAutoreleasePoolPop() {
    NSMutableDictionary *dic =  [NSThread currentThread].threadDictionary;
    NSMutableArray *poolStack = dic[YZNSThreadAutoleasePoolStackKey];
    [poolStack removeLastObject]; // pop
}

static void YZRunLoopAutoreleasePoolObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry: {
            YZAutoreleasePoolPush();
        } break;
        case kCFRunLoopBeforeWaiting: {
            YZAutoreleasePoolPop();
            YZAutoreleasePoolPush();
        } break;
        case kCFRunLoopExit: {
            YZAutoreleasePoolPop();
        } break;
        default: break;
    }
}

static void YZRunloopAutoreleasePoolSetup() {
    CFRunLoopRef runloop = CFRunLoopGetCurrent();

    CFRunLoopObserverRef pushObserver;
    pushObserver = CFRunLoopObserverCreate(CFAllocatorGetDefault(), kCFRunLoopEntry,
                                           true,         // repeat
                                           -0x7FFFFFFF,  // before other observers
                                           YZRunLoopAutoreleasePoolObserverCallBack, NULL);
    CFRunLoopAddObserver(runloop, pushObserver, kCFRunLoopCommonModes);
    CFRelease(pushObserver);
    
    CFRunLoopObserverRef popObserver;
    popObserver = CFRunLoopObserverCreate(CFAllocatorGetDefault(), kCFRunLoopBeforeWaiting | kCFRunLoopExit,
                                          true,        // repeat
                                          0x7FFFFFFF,  // after other observers
                                          YZRunLoopAutoreleasePoolObserverCallBack, NULL);
    CFRunLoopAddObserver(runloop, popObserver, kCFRunLoopCommonModes);
    CFRelease(popObserver);
}

@implementation NSThread (YZAdd)

+ (void)yz_addAutoreleasePoolToCurrentRunloop {
    if ([NSThread isMainThread]) return; // The main thread already has autorelease pool.
    NSThread *thread = [self currentThread];
    if (!thread) return;
    if (thread.threadDictionary[YZNSThreadAutoleasePoolKey]) return; // already added
    YZRunloopAutoreleasePoolSetup();
    thread.threadDictionary[YZNSThreadAutoleasePoolKey] = YZNSThreadAutoleasePoolKey; // mark the state
}

@end
