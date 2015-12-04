//
//  NewsSuperController.m
//  Shorthair
//
//  Created by Herbert Hu on 15/12/4.
//  Copyright © 2015年 Herbert Hu. All rights reserved.
//

#import "NewsSuperController.h"
#import "HHSlideView.h"

#import "NewsViewController.h"
#import "MyTrendsViewController.h"

#import "UIColor+extend.h"
#import "UtilsMacro.h"

@interface NewsSuperController () <HHSlideViewDelegate>

@property (strong, nonatomic) HHSlideView *slideView;
@property (strong, nonatomic) NewsViewController *newsVC;
@property (strong, nonatomic) MyTrendsViewController *myTrendsVC;

@end

@implementation NewsSuperController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.slideView];
    [self initChildController];
}

#pragma mark - Getter

- (HHSlideView *)slideView {
    
    if (!_slideView) {
        
        _slideView = [[HHSlideView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
        _slideView.delegate = self;
    }

    return _slideView;
}

#pragma mark - Init

- (void)initChildController {
    
    _newsVC = [NewsViewController new];
    _myTrendsVC = [MyTrendsViewController new];
    
//    [_newsVC.view setBackgroundColor:[UIColor purpleColor]];
//    [_myTrendsVC.view setBackgroundColor:[UIColor lightGrayColor]];
}

#pragma mark - HHSlideViewDelegate

- (NSInteger)numberOfSlideItemsInSlideView:(HHSlideView *)slideView {
    
    return 2;
}

- (NSArray *)namesOfSlideItemsInSlideView:(HHSlideView *)slideView {
    
    return @[@"News", @"My Trends"];
}

- (NSArray *)childViewControllersInSlideView:(HHSlideView *)slideView {
    
    NSArray *childVC = @[_newsVC, _myTrendsVC];
    return childVC;
}

- (void)slideView:(HHSlideView *)slideView didSelectItemAtIndex:(NSInteger)index {
    
    
}

- (UIColor *)colorOfSliderInSlideView:(HHSlideView *)slideView {
    
    return ColorOfSlider;
}

- (UIColor *)colorOfSlideView:(HHSlideView *)slideView {
    
    return ColorOfSlideView;
}

@end
