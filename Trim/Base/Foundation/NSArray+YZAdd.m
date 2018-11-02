//
//  NSArray+YZAdd.m
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/30.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "NSArray+YZAdd.h"
#import "YZTirmMacro.h"
#import "NSData+YZAdd.h"

YZSYNTH_DUMMY_CLASS(NSArray_YZAdd)


@implementation NSArray (YZAdd)

+ (NSArray *)yz_arrayWithPlistData:(NSData *)plist {
    if (!plist) return nil;
    NSArray *array = [NSPropertyListSerialization propertyListWithData:plist options:NSPropertyListImmutable format:NULL error:NULL];
    if ([array isKindOfClass:[NSArray class]]) return array;
    return nil;
}

+ (NSArray *)yz_arrayWithPlistString:(NSString *)plist {
    if (!plist) return nil;
    NSData *data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    return [self yz_arrayWithPlistData:data];
}

- (NSData *)yz_plistData {
    return [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListBinaryFormat_v1_0 options:kNilOptions error:NULL];
}

- (NSString *)yz_plistString {
    NSData *xmlData = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0 options:kNilOptions error:NULL];
    if (xmlData) return xmlData.utf8String;
    return nil;
}

- (id)yz_randomObject {
    if (self.count) {
        return self[arc4random_uniform((u_int32_t)self.count)];
    }
    return nil;
}

- (id)yz_objectOrNilAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
}

- (NSString *)yz_jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) return json;
    }
    return nil;
}

- (NSString *)yz_jsonPrettyStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) return json;
    }
    return nil;
}

@end



@implementation NSMutableArray (YZAdd)

+ (NSMutableArray *)yz_arrayWithPlistData:(NSData *)plist {
    if (!plist) return nil;
    NSMutableArray *array = [NSPropertyListSerialization propertyListWithData:plist options:NSPropertyListMutableContainersAndLeaves format:NULL error:NULL];
    if ([array isKindOfClass:[NSMutableArray class]]) return array;
    return nil;
}

+ (NSMutableArray *)yz_arrayWithPlistString:(NSString *)plist {
    if (!plist) return nil;
    NSData *data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    return [self yz_arrayWithPlistData:data];
}

- (void)yz_removeFirstObject {
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)yz_removeLastObject {
    if (self.count) {
        [self removeObjectAtIndex:self.count - 1];
    }
}

#pragma clang diagnostic pop


- (id)yz_popFirstObject {
    id obj = nil;
    if (self.count) {
        obj = self.firstObject;
        [self yz_removeFirstObject];
    }
    return obj;
}

- (id)yz_popLastObject {
    id obj = nil;
    if (self.count) {
        obj = self.lastObject;
        [self removeLastObject];
    }
    return obj;
}

- (void)yz_appendObject:(id)anObject {
    [self addObject:anObject];
}

- (void)yz_prependObject:(id)anObject {
    [self insertObject:anObject atIndex:0];
}

- (void)yz_appendObjects:(NSArray *)objects {
    if (!objects) return;
    [self addObjectsFromArray:objects];
}

- (void)yz_prependObjects:(NSArray *)objects {
    if (!objects) return;
    NSUInteger i = 0;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)yz_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index {
    NSUInteger i = index;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)yz_reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

- (void)yz_shuffle {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
}

@end
