//
//  CALayer+YZAdd.h
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/31.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `CALayer`.
 */
@interface CALayer (YZAdd)

/**
 Take snapshot without transform, image's size equals to bounds.
 */
- (nullable UIImage *)yz_snapshotImage;

/**
 Take snapshot without transform, PDF's page size equals to bounds.
 */
- (nullable NSData *)yz_snapshotPDF;

/**
 Shortcut to set the layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)yz_setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 Remove all sublayers.
 */
- (void)yz_removeAllSublayers;

@property (nonatomic, setter=yz_setLeft:) CGFloat yz_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic, setter=yz_setTop:) CGFloat yz_top;         ///< Shortcut for frame.origin.y
@property (nonatomic, setter=yz_setRight:) CGFloat yz_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic, setter=yz_setBottom:) CGFloat yz_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic, setter=yz_setWidth:) CGFloat yz_width;       ///< Shortcut for frame.size.width.
@property (nonatomic, setter=yz_setHeight:) CGFloat yz_height;      ///< Shortcut for frame.size.height.
@property (nonatomic, setter=yz_setCenter:) CGPoint yz_center;      ///< Shortcut for center.
@property (nonatomic, setter=yz_setCenterX:) CGFloat yz_centerX;     ///< Shortcut for center.x
@property (nonatomic, setter=yz_setCenterY:) CGFloat yz_centerY;     ///< Shortcut for center.y
@property (nonatomic, setter=yz_setOrigin:) CGPoint yz_origin;      ///< Shortcut for frame.origin.
@property (nonatomic, getter=frameSize, setter=setFrameSize:) CGSize  yz_size; ///< Shortcut for frame.size.


@property (nonatomic, setter=yz_setTransformRotation:) CGFloat yz_transformRotation;     ///< key path "tranform.rotation"
@property (nonatomic, setter=yz_setTransformRotationX:) CGFloat yz_transformRotationX;    ///< key path "tranform.rotation.x"
@property (nonatomic, setter=yz_setTransformRotationY:) CGFloat yz_transformRotationY;    ///< key path "tranform.rotation.y"
@property (nonatomic, setter=yz_setTransformRotationZ:) CGFloat yz_transformRotationZ;    ///< key path "tranform.rotation.z"
@property (nonatomic, setter=yz_setTransformScale:) CGFloat yz_transformScale;        ///< key path "tranform.scale"
@property (nonatomic, setter=yz_setTransformScaleX:) CGFloat yz_transformScaleX;       ///< key path "tranform.scale.x"
@property (nonatomic, setter=yz_setTransformScaleY:) CGFloat yz_transformScaleY;       ///< key path "tranform.scale.y"
@property (nonatomic, setter=yz_setTransformScaleZ:) CGFloat yz_transformScaleZ;       ///< key path "tranform.scale.z"
@property (nonatomic, setter=yz_setTransformScaleX:) CGFloat yz_transformTranslationX; ///< key path "tranform.translation.x"
@property (nonatomic, setter=yz_setTransformScaleY:) CGFloat yz_transformTranslationY; ///< key path "tranform.translation.y"
@property (nonatomic, setter=yz_setTransformScaleZ:) CGFloat yz_transformTranslationZ; ///< key path "tranform.translation.z"

/**
 Shortcut for transform.m34, -1/1000 is a good value.
 It should be set before other transform shortcut.
 */
@property (nonatomic, setter=yz_setTransformDepth:) CGFloat yz_transformDepth;

/**
 Wrapper for `contentsGravity` property.
 */
@property (nonatomic) UIViewContentMode contentMode;

/**
 Add a fade animation to layer's contents when the contents is changed.
 
 @param duration Animation duration
 @param curve    Animation curve.
 */
- (void)yz_addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve;

/**
 Cancel fade animation which is added with "-addFadeAnimationWithDuration:curve:".
 */
- (void)yz_removePreviousFadeAnimation;

@end

NS_ASSUME_NONNULL_END
