//
//  BCViewController.h
//  BezierCurveExamples
//
//  Created by Adam Wulf on 9/10/12.
//  Copyright (c) 2012 Graceful Construction, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCViewController : UIViewController<UIScrollViewDelegate>{
    IBOutlet UIScrollView* scrollView;
    IBOutlet UIPageControl* pageControl;
}

@end
