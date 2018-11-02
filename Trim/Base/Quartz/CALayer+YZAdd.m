//
//  CALayer+YZAdd.m
//  YZMySelfLibrary
//
//  Created by 叶志强 on 2018/8/31.
//  Copyright © 2018年 CancerQ. All rights reserved.
//

#import "CALayer+YZAdd.h"
#import "YZTirmMacro.h"
#import "YZCGUtilities.h"

YZSYNTH_DUMMY_CLASS(CALayer_YZAdd)


@implementation CALayer (YZAdd)

- (UIImage *)yz_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (NSData *)yz_snapshotPDF {
    CGRect bounds = self.bounds;
    NSMutableData *data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

- (void)yz_setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.shadowColor = color.CGColor;
    self.shadowOffset = offset;
    self.shadowRadius = radius;
    self.shadowOpacity = 1;
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)yz_removeAllSublayers {
    while (self.sublayers.count) {
        [self.sublayers.lastObject removeFromSuperlayer];
    }
}

- (CGFloat)yz_left {
    return self.frame.origin.x;
}

- (void)yz_setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)yz_top {
    return self.frame.origin.y;
}

- (void)yz_setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)yz_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)yz_setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)yz_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)yz_setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)yz_width {
    return self.frame.size.width;
}

- (void)yz_setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)yz_height {
    return self.frame.size.height;
}

- (void)yz_setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)yz_center {
    return CGPointMake(self.frame.origin.x + self.frame.size.width * 0.5,
                       self.frame.origin.y + self.frame.size.height * 0.5);
}

- (void)yz_setCenter:(CGPoint)center {
    CGRect frame = self.frame;
    frame.origin.x = center.x - frame.size.width * 0.5;
    frame.origin.y = center.y - frame.size.height * 0.5;
    self.frame = frame;
}

- (CGFloat)yz_centerX {
    return self.frame.origin.x + self.frame.size.width * 0.5;
}

- (void)yz_setCenterX:(CGFloat)centerX {
    CGRect frame = self.frame;
    frame.origin.x = centerX - frame.size.width * 0.5;
    self.frame = frame;
}

- (CGFloat)yz_centerY {
    return self.frame.origin.y + self.frame.size.height * 0.5;
}

- (void)yz_setCenterY:(CGFloat)centerY {
    CGRect frame = self.frame;
    frame.origin.y = centerY - frame.size.height * 0.5;
    self.frame = frame;
}

- (CGPoint)yz_origin {
    return self.frame.origin;
}

- (void)yz_setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)frameSize {
    return self.frame.size;
}

- (void)setFrameSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)yz_transformRotation {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation"];
    return v.doubleValue;
}

- (void)yz_setTransformRotation:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.rotation"];
}

- (CGFloat)yz_transformRotationX {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.x"];
    return v.doubleValue;
}

- (void)yz_setTransformRotationX:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.rotation.x"];
}

- (CGFloat)yz_transformRotationY {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.y"];
    return v.doubleValue;
}

- (void)yz_setTransformRotationY:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.rotation.y"];
}

- (CGFloat)yz_transformRotationZ {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.z"];
    return v.doubleValue;
}

- (void)yz_setTransformRotationZ:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.rotation.z"];
}

- (CGFloat)yz_transformScaleX {
    NSNumber *v = [self valueForKeyPath:@"transform.scale.x"];
    return v.doubleValue;
}

- (void)yz_setTransformScaleX:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.scale.x"];
}

- (CGFloat)yz_transformScaleY {
    NSNumber *v = [self valueForKeyPath:@"transform.scale.y"];
    return v.doubleValue;
}

- (void)yz_setTransformScaleY:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.scale.y"];
}

- (CGFloat)yz_transformScaleZ {
    NSNumber *v = [self valueForKeyPath:@"transform.scale.z"];
    return v.doubleValue;
}

- (void)yz_setTransformScaleZ:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.scale.z"];
}

- (CGFloat)yz_transformScale {
    NSNumber *v = [self valueForKeyPath:@"transform.scale"];
    return v.doubleValue;
}

- (void)yz_setTransformScale:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.scale"];
}

- (CGFloat)yz_transformTranslationX {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.x"];
    return v.doubleValue;
}

- (void)yz_setTransformTranslationX:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.translation.x"];
}

- (CGFloat)yz_transformTranslationY {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.y"];
    return v.doubleValue;
}

- (void)yz_setTransformTranslationY:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.translation.y"];
}

- (CGFloat)yz_transformTranslationZ {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.z"];
    return v.doubleValue;
}

- (void)yz_setTransformTranslationZ:(CGFloat)v {
    [self setValue:@(v) forKeyPath:@"transform.translation.z"];
}

- (CGFloat)yz_transformDepth {
    return self.transform.m34;
}

- (void)yz_setTransformDepth:(CGFloat)v {
    CATransform3D d = self.transform;
    d.m34 = v;
    self.transform = d;
}

- (UIViewContentMode)contentMode {
    return YZCAGravityToUIViewContentMode(self.contentsGravity);
}

- (void)setContentMode:(UIViewContentMode)contentMode {
    self.contentsGravity = YZUIViewContentModeToCAGravity(contentMode);
}

- (void)yz_addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve {
    if (duration <= 0) return;
    
    NSString *mediaFunction;
    switch (curve) {
        case UIViewAnimationCurveEaseInOut: {
            mediaFunction = kCAMediaTimingFunctionEaseInEaseOut;
        } break;
        case UIViewAnimationCurveEaseIn: {
            mediaFunction = kCAMediaTimingFunctionEaseIn;
        } break;
        case UIViewAnimationCurveEaseOut: {
            mediaFunction = kCAMediaTimingFunctionEaseOut;
        } break;
        case UIViewAnimationCurveLinear: {
            mediaFunction = kCAMediaTimingFunctionLinear;
        } break;
        default: {
            mediaFunction = kCAMediaTimingFunctionLinear;
        } break;
    }
    
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:mediaFunction];
    transition.type = kCATransitionFade;
    [self addAnimation:transition forKey:@"yztrim.fade"];
}

- (void)yz_removePreviousFadeAnimation {
    [self removeAnimationForKey:@"yztrim.fade"];
}

@end
