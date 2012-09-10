//
//  BCAppDelegate.h
//  BezierCurveExamples
//
//  Created by Adam Wulf on 9/10/12.
//  Copyright (c) 2012 Graceful Construction, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCViewController;

@interface BCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BCViewController *viewController;

@end
