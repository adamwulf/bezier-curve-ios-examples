//
//  BCClippedImageView.h
//  BezierCurveExamples
//
//  Created by Adam Wulf on 9/10/12.
//  Copyright (c) 2012 Graceful Construction, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCClippedImageView : UIView{
    NSMutableArray* clipRects;
    UIImage* image;
}

@property (nonatomic, retain) UIImage* image;

-(void) addClipRect:(CGRect)clipRect;

@end
