//
//  BCViewController.m
//  BezierCurveExamples
//
//  Created by Adam Wulf on 9/10/12.
//  Copyright (c) 2012 Graceful Construction, LLC. All rights reserved.
//

#import "BCViewController.h"

static const int kNumberOfPages = 3;

@interface BCViewController ()

@end

@implementation BCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width*kNumberOfPages, scrollView.bounds.size.height);
    pageControl.numberOfPages = kNumberOfPages;
    pageControl.currentPage = 0;
    
    [scrollView addSubview:page1];
    [scrollView addSubview:page2];
    page1.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    
    //
    // TODO
    //
    // page 3 should use a mask image: http://stackoverflow.com/questions/8308802/ios-uiimage-clip-to-paths
    // that's defined from the other views on the screen (memory hog :( )
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView{
    pageControl.currentPage = (scrollView.contentOffset.x + _scrollView.bounds.size.width/2) / _scrollView.bounds.size.width;
}

@end
