//
//  NSKeyedUnarchiver+YZAdd.h
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/30.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `NSKeyedUnarchiver`.
 */
@interface NSKeyedUnarchiver (YZAdd)

/**
 Same as unarchiveObjectWithData:, except it returns the exception by reference.
 
 @param data       The data need unarchived.
 
 @param exception  Pointer which will, upon return, if an exception occurred and
 said pointer is not NULL, point to said NSException.
 */
+ (nullable id)yz_unarchiveObjectWithData:(NSData *)data
                             exception:(NSException *_Nullable *_Nullable)exception;

/**
 Same as unarchiveObjectWithFile:, except it returns the exception by reference.
 
 @param path       The path of archived object file.
 
 @param exception  Pointer which will, upon return, if an exception occurred and
 said  pointer is not NULL, point to said NSException.
 */
+ (nullable id)yz_unarchiveObjectWithFile:(NSString *)path
                             exception:(NSException *_Nullable *_Nullable)exception;

@end

NS_ASSUME_NONNULL_END
