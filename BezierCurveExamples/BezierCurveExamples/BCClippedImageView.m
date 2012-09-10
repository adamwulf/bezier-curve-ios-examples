//
//  BCClippedImageView.m
//  BezierCurveExamples
//
//  Created by Adam Wulf on 9/10/12.
//  Copyright (c) 2012 Graceful Construction, LLC. All rights reserved.
//

#import "BCClippedImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BCClippedImageView

@synthesize image;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setImage:(UIImage *)_image{
    image = [_image retain];
    CGRect fr = self.frame;
    fr.size = self.image.size;
    self.frame = fr;
}

-(void) addClipRect:(CGRect)clipRect{
    if(!clipRects){
        clipRects = [[NSMutableArray alloc] initWithCapacity:3];
    }
    [clipRects addObject:[NSValue valueWithCGRect:clipRect]];
    [self setNeedsDisplay];
}

-(void) drawRect:(CGRect)rect{
    CGContextSaveGState(UIGraphicsGetCurrentContext());
    for(NSValue* val in clipRects){
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:CGRectInfinite];
        [clipPath appendPath:[UIBezierPath bezierPathWithRect:[val CGRectValue]]];
        clipPath.usesEvenOddFillRule = YES;
        [clipPath addClip];
    }
    [self.image drawAtPoint:CGPointZero];
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}


@end
