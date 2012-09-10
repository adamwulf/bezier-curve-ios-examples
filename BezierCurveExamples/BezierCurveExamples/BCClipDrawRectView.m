//
//  BCClipDrawRectView.m
//  BezierCurveExamples
//
//  Created by Adam Wulf on 9/10/12.
//  Copyright (c) 2012 Graceful Construction, LLC. All rights reserved.
//

#import "BCClipDrawRectView.h"

@implementation BCClipDrawRectView

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
//    CGRect marsRect = mars.bounds;
    CGRect spacemanRect = [mars convertRect:spaceman.frame fromView:spaceman.superview];
    CGRect spaceshipRect = [mars convertRect:spaceship.frame fromView:spaceship.superview];
    CGRect spaceship2Rect = [mars convertRect:spaceship2.frame fromView:spaceship2.superview];
    
    mars.image = [UIImage imageNamed:@"mars.png"];
    spaceman.image = [UIImage imageNamed:@"spaceman.png"];
    spaceship.image = [UIImage imageNamed:@"spaceship.jpg"];
    spaceship.image = [UIImage imageNamed:@"spaceship.jpg"];
    
    [mars addClipRect:spacemanRect];
    [mars addClipRect:spaceshipRect];
    [mars addClipRect:spaceship2Rect];
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
