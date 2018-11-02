//
//  NSNumber+YZAdd.h
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/30.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provide a method to parse `NSString` for `NSNumber`.
 */
@interface NSNumber (YZAdd)

/**
 Creates and returns an NSNumber object from a string.
 Valid format: @"12", @"12.345", @" -0xFF", @" .23e99 "...
 
 @param string  The string described an number.
 
 @return an NSNumber when parse succeed, or nil if an error occurs.
 */
+ (nullable NSNumber *)yz_numberWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
