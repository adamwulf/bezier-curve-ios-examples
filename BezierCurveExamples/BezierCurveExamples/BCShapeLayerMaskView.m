//
//  BCShapeLayerMaskView.m
//  BezierCurveExamples
//
//  Created by Adam Wulf on 9/10/12.
//  Copyright (c) 2012 Graceful Construction, LLC. All rights reserved.
//

#import "BCShapeLayerMaskView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BCShapeLayerMaskView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) awakeFromNib{
    // first, convert the top view into the bottom view's coordinate system
    CGRect marsRect = mars.bounds;
    CGRect spacemanRect = [mars convertRect:spaceman.frame fromView:spaceman.superview];
    CGRect spaceshipRect = [mars convertRect:spaceship.frame fromView:spaceship.superview];
    CGRect spaceship2Rect = [mars convertRect:spaceship2.frame fromView:spaceship2.superview];
    
    //
    // first, define the path that could possibly be visible:
//    UIBezierPath* possiblyVisiblePath = [UIBezierPath bezierPath];
//    [possiblyVisiblePath appendPath:[UIBezierPath bezierPathWithRect:mars.bounds]];
    
    
    UIBezierPath *possiblyVisiblePath = [UIBezierPath bezierPath];
    [possiblyVisiblePath moveToPoint:CGPointMake(marsRect.origin.x, marsRect.origin.y)];
    [possiblyVisiblePath addLineToPoint:CGPointMake(marsRect.origin.x + marsRect.size.width, marsRect.origin.y)];
    [possiblyVisiblePath addLineToPoint:CGPointMake(marsRect.origin.x + marsRect.size.width, marsRect.origin.y + marsRect.size.height)];
    [possiblyVisiblePath addLineToPoint:CGPointMake(marsRect.origin.x, marsRect.origin.y + marsRect.size.height)];
    [possiblyVisiblePath closePath];
    
    possiblyVisiblePath = [UIBezierPath bezierPathWithRect:CGRectInfinite];
    
    UIBezierPath* pathToClip = [UIBezierPath bezierPath];
    
    //
    // the definitely not visible path needs to be
    // in the reverse direction so that it cuts out a hole
    // of the possiblyVisiblePath (effectively making the
    // possible visible area less than or equal to itself)
    UIBezierPath *definitelyNotVisibleBehindSpacemanPath = [UIBezierPath bezierPath];
    [definitelyNotVisibleBehindSpacemanPath moveToPoint:CGPointMake(spacemanRect.origin.x, spacemanRect.origin.y)];
    [definitelyNotVisibleBehindSpacemanPath addLineToPoint:CGPointMake(spacemanRect.origin.x, spacemanRect.origin.y + spacemanRect.size.height)];
    [definitelyNotVisibleBehindSpacemanPath addLineToPoint:CGPointMake(spacemanRect.origin.x + spacemanRect.size.width, spacemanRect.origin.y + spacemanRect.size.height)];
    [definitelyNotVisibleBehindSpacemanPath addLineToPoint:CGPointMake(spacemanRect.origin.x + spacemanRect.size.width, spacemanRect.origin.y)];
    [definitelyNotVisibleBehindSpacemanPath closePath];
    
    UIBezierPath *definitelyNotVisibleBehindSpaceshipPath = [UIBezierPath bezierPath];
    [definitelyNotVisibleBehindSpaceshipPath moveToPoint:CGPointMake(spaceshipRect.origin.x, spaceshipRect.origin.y)];
    [definitelyNotVisibleBehindSpaceshipPath addLineToPoint:CGPointMake(spaceshipRect.origin.x, spaceshipRect.origin.y + spaceshipRect.size.height)];
    [definitelyNotVisibleBehindSpaceshipPath addLineToPoint:CGPointMake(spaceshipRect.origin.x + spaceshipRect.size.width, spaceshipRect.origin.y + spaceshipRect.size.height)];
    [definitelyNotVisibleBehindSpaceshipPath addLineToPoint:CGPointMake(spaceshipRect.origin.x + spaceshipRect.size.width, spaceshipRect.origin.y)];
    [definitelyNotVisibleBehindSpaceshipPath closePath];
    
    UIBezierPath *definitelyNotVisibleBehindSpaceship2Path = [UIBezierPath bezierPath];
    [definitelyNotVisibleBehindSpaceship2Path moveToPoint:CGPointMake(spaceship2Rect.origin.x, spaceship2Rect.origin.y)];
    [definitelyNotVisibleBehindSpaceship2Path addLineToPoint:CGPointMake(spaceship2Rect.origin.x, spaceship2Rect.origin.y + spaceship2Rect.size.height)];
    [definitelyNotVisibleBehindSpaceship2Path addLineToPoint:CGPointMake(spaceship2Rect.origin.x + spaceship2Rect.size.width, spaceship2Rect.origin.y + spaceship2Rect.size.height)];
    [definitelyNotVisibleBehindSpaceship2Path addLineToPoint:CGPointMake(spaceship2Rect.origin.x + spaceship2Rect.size.width, spaceship2Rect.origin.y)];
    [definitelyNotVisibleBehindSpaceship2Path closePath];
    

    //
    // now add that path to crop out the invisible area
//    [possiblyVisiblePath appendPath:definitelyNotVisibleBehindSpacemanPath];
//    [possiblyVisiblePath appendPath:definitelyNotVisibleBehindSpaceshipPath];

    [pathToClip appendPath:[UIBezierPath bezierPathWithRect:marsRect]];
    [pathToClip appendPath:definitelyNotVisibleBehindSpacemanPath];
    [pathToClip appendPath:definitelyNotVisibleBehindSpaceshipPath];
    [pathToClip appendPath:definitelyNotVisibleBehindSpaceship2Path];
    
//    possiblyVisiblePath = [possiblyVisiblePath bezierPathByReversingPath];
//    pathToClip = [pathToClip bezierPathByReversingPath];
    
    //
    // create a mask layer from the bezier curve
    // that defines the edge of all views that hide our content.
    // (in this demo case, just 1 view's path, the definitelyNotVisiblePath)
    CAShapeLayer* maskLayer = [CAShapeLayer layer];
    maskLayer.frame = mars.layer.bounds;
    maskLayer.fillColor = [UIColor greenColor].CGColor; // needs to be opaque
    maskLayer.backgroundColor = [UIColor clearColor].CGColor; // needs to be clear
    maskLayer.path = pathToClip.CGPath;
    maskLayer.fillRule = kCAFillRuleNonZero;
    //        maskLayer.borderColor = [UIColor purpleColor].CGColor;
    //        maskLayer.borderWidth = 1;
    //        maskLayer.lineWidth = 1;
    //        maskLayer.strokeColor = [UIColor orangeColor].CGColor;
//    [mars.layer addSublayer:maskLayer]; // used for debugging
    mars.layer.mask = maskLayer;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
