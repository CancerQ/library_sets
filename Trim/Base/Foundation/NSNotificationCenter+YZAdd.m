//
//  NSNotificationCenter+YZAdd.m
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/30.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "NSNotificationCenter+YZAdd.h"
#include <pthread.h>
#import "YZTirmMacro.h"

YZSYNTH_DUMMY_CLASS(NSNotificationCenter_YZAdd)


@implementation NSNotificationCenter (YZAdd)

- (void)yz_postNotificationOnMainThread:(NSNotification *)notification {
    if (pthread_main_np()) return [self postNotification:notification];
    [self yz_postNotificationOnMainThread:notification waitUntilDone:NO];
}

- (void)yz_postNotificationOnMainThread:(NSNotification *)notification waitUntilDone:(BOOL)wait {
    if (pthread_main_np()) return [self postNotification:notification];
    [[self class] performSelectorOnMainThread:@selector(_yz_postNotification:) withObject:notification waitUntilDone:wait];
}

- (void)yz_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object {
    if (pthread_main_np()) return [self postNotificationName:name object:object userInfo:nil];
    [self yz_postNotificationOnMainThreadWithName:name object:object userInfo:nil waitUntilDone:NO];
}

- (void)yz_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
    if (pthread_main_np()) return [self postNotificationName:name object:object userInfo:userInfo];
    [self yz_postNotificationOnMainThreadWithName:name object:object userInfo:userInfo waitUntilDone:NO];
}

- (void)yz_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo waitUntilDone:(BOOL)wait {
    if (pthread_main_np()) return [self postNotificationName:name object:object userInfo:userInfo];
    NSMutableDictionary *info = [[NSMutableDictionary allocWithZone:nil] initWithCapacity:3];
    if (name) [info setObject:name forKey:@"name"];
    if (object) [info setObject:object forKey:@"object"];
    if (userInfo) [info setObject:userInfo forKey:@"userInfo"];
    [[self class] performSelectorOnMainThread:@selector(_yz_postNotificationName:) withObject:info waitUntilDone:wait];
}

+ (void)_yz_postNotification:(NSNotification *)notification {
    [[self defaultCenter] postNotification:notification];
}

+ (void)_yz_postNotificationName:(NSDictionary *)info {
    NSString *name = [info objectForKey:@"name"];
    id object = [info objectForKey:@"object"];
    NSDictionary *userInfo = [info objectForKey:@"userInfo"];
    
    [[self defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}

@end
