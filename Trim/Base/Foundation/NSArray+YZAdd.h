//
//  NSArray+YZAdd.h
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/30.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provide some some common method for `NSArray`.
 */
@interface NSArray<__covariant ObjectType> (YZAdd)

/**
 Creates and returns an array from a specified property list data.
 
 @param plist   A property list data whose root object is an array.
 @return A new array created from the binary plist data, or nil if an error occurs.
 */
+ (nullable NSArray *)yz_arrayWithPlistData:(NSData *)plist;

/**
 Creates and returns an array from a specified property list xml string.
 
 @param plist   A property list xml string whose root object is an array.
 @return A new array created from the plist string, or nil if an error occurs.
 */
+ (nullable NSArray *)yz_arrayWithPlistString:(NSString *)plist;

/**
 Serialize the array to a binary property list data.
 
 @return A binary plist data, or nil if an error occurs.
 */
- (nullable NSData *)yz_plistData;

/**
 Serialize the array to a xml property list string.
 
 @return A plist xml string, or nil if an error occurs.
 */
- (nullable NSString *)yz_plistString;

/**
 Returns the object located at a random index.
 
 @return The object in the array with a random index value.
 If the array is empty, returns nil.
 */
- (nullable ObjectType)yz_randomObject;

/**
 Returns the object located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 
 @param index The object located at index.
 */
- (nullable ObjectType)yz_objectOrNilAtIndex:(NSUInteger)index;

/**
 Convert object to json string. return nil if an error occurs.
 NSString/NSNumber/NSDictionary/NSArray
 */
- (nullable NSString *)yz_jsonStringEncoded;

/**
 Convert object to json string formatted. return nil if an error occurs.
 */
- (nullable NSString *)yz_jsonPrettyStringEncoded;

@end


/**
 Provide some some common method for `NSMutableArray`.
 */
@interface NSMutableArray<ObjectType>  (YZAdd)

/**
 Creates and returns an array from a specified property list data.
 
 @param plist   A property list data whose root object is an array.
 @return A new array created from the binary plist data, or nil if an error occurs.
 */
+ (nullable NSMutableArray *)yz_arrayWithPlistData:(NSData *)plist;

/**
 Creates and returns an array from a specified property list xml string.
 
 @param plist   A property list xml string whose root object is an array.
 @return A new array created from the plist string, or nil if an error occurs.
 */
+ (nullable NSMutableArray *)yz_arrayWithPlistString:(NSString *)plist;

/**
 Removes the object with the lowest-valued index in the array.
 If the array is empty, this method has no effect.
 
 @discussion Apple has implemented this method, but did not make it public.
 Override for safe.
 */
- (void)yz_removeFirstObject;

/**
 Removes the object with the highest-valued index in the array.
 If the array is empty, this method has no effect.
 
 @discussion Apple's implementation said it raises an NSRangeException if the
 array is empty, but in fact nothing will happen. Override for safe.
 */
- (void)yz_removeLastObject;

/**
 Removes and returns the object with the lowest-valued index in the array.
 If the array is empty, it just returns nil.
 
 @return The first object, or nil.
 */
- (nullable ObjectType)yz_popFirstObject;

/**
 Removes and returns the object with the highest-valued index in the array.
 If the array is empty, it just returns nil.
 
 @return The first object, or nil.
 */
- (nullable ObjectType)yz_popLastObject;

/**
 Inserts a given object at the end of the array.
 
 @param anObject The object to add to the end of the array's content.
 This value must not be nil. Raises an NSInvalidArgumentException if anObject is nil.
 */
- (void)yz_appendObject:(id)anObject;

/**
 Inserts a given object at the beginning of the array.
 
 @param anObject The object to add to the end of the array's content.
 This value must not be nil. Raises an NSInvalidArgumentException if anObject is nil.
 */
- (void)yz_prependObject:(id)anObject;

/**
 Adds the objects contained in another given array to the end of the receiving
 array's content.
 
 @param objects An array of objects to add to the end of the receiving array's
 content. If the objects is empty or nil, this method has no effect.
 */
- (void)yz_appendObjects:(NSArray *)objects;

/**
 Adds the objects contained in another given array to the beginnin of the receiving
 array's content.
 
 @param objects An array of objects to add to the beginning of the receiving array's
 content. If the objects is empty or nil, this method has no effect.
 */
- (void)yz_prependObjects:(NSArray *)objects;

/**
 Adds the objects contained in another given array at the index of the receiving
 array's content.
 
 @param objects An array of objects to add to the receiving array's
 content. If the objects is empty or nil, this method has no effect.
 
 @param index The index in the array at which to insert objects. This value must
 not be greater than the count of elements in the array. Raises an
 NSRangeException if index is greater than the number of elements in the array.
 */
- (void)yz_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index;

/**
 Reverse the index of object in this array.
 Example: Before @[ @1, @2, @3 ], After @[ @3, @2, @1 ].
 */
- (void)yz_reverse;

/**
 Sort the object in this array randomly.
 */
- (void)yz_shuffle;

@end

NS_ASSUME_NONNULL_END
