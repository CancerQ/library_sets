//
//  UIBarButtonItem+YZAdd.m
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/31.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "UIBarButtonItem+YZAdd.h"

#import "YZTirmMacro.h"
#import <objc/runtime.h>

YZSYNTH_DUMMY_CLASS(UIBarButtonItem_YZAdd)


static const int block_key;

@interface _YZUIBarButtonItemBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation _YZUIBarButtonItemBlockTarget

- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (self.block) self.block(sender);
}

@end


@implementation UIBarButtonItem (YZAdd)

- (void)setActionBlock:(void (^)(id sender))block {
    _YZUIBarButtonItemBlockTarget *target = [[_YZUIBarButtonItemBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &block_key, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTarget:target];
    [self setAction:@selector(invoke:)];
}

- (void (^)(id)) actionBlock {
    _YZUIBarButtonItemBlockTarget *target = objc_getAssociatedObject(self, &block_key);
    return target.block;
}

@end

