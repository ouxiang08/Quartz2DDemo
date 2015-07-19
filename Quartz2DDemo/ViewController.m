//
//  ViewController.m
//  Quartz2DDemo
//
//  Created by jiajingjing on 15/6/30.
//  Copyright (c) 2015年 jiajingjing. All rights reserved.
//

#import "ViewController.h"
#import "QDGradientView.h"
#import "QDView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)addShap {
    

    CGRect r = CGRectMake(0, 0, self.view.frame.size.width, 100);
    QDView *view = [[QDView alloc] initWithFrame:self.view.bounds];
    view.center = self.view.center;
    //view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:view];
}

- (void)bezierpath {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBezierPath *circleBezier = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:100 startAngle:0 endAngle:M_PI clockwise:0];
    
    CAShapeLayer *circleShap = [CAShapeLayer layer];
    circleShap.path = [circleBezier CGPath];
    circleShap.fillColor = [UIColor orangeColor].CGColor;
    circleShap.frame = self.view.bounds;
    
    [self.view.layer addSublayer:circleShap];
    
    
    NSArray *lengths = [NSArray arrayWithObjects:[NSNumber numberWithFloat:4.0f],[NSNumber numberWithFloat:2.0f],[NSNumber numberWithFloat:4.0f], nil];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:100 startAngle:0 endAngle:M_PI*2 clockwise:0];
    //UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(self.view.center.x-75, self.view.center.y-75, 150, 150)];
    //UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.view.center.x-75, self.view.center.y-75, 150, 220)];
    //UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.view.center.x-75, self.view.center.y-75, 150, 150) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(16, 10)];
    //UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, self.view.center.y, self.view.frame.size.width-10*2, 16) cornerRadius:8];
    
    //UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    //[bezierPath moveToPoint:CGPointMake(CGRectGetMidX(self.view.frame), 0)];
    //[bezierPath addCurveToPoint:CGPointMake(self.view.frame.size.width*0.25, self.view.frame.size.height) controlPoint1:CGPointMake(CGRectGetMidX(self.view.frame)/2,  self.view.frame.size.height*0.25) controlPoint2:CGPointMake(self.view.frame.size.width*0.75,  self.view.frame.size.height*0.75)];
    //[bezierPath addQuadCurveToPoint:CGPointMake(self.view.frame.size.width*0.25, self.view.frame.size.height) controlPoint:CGPointMake(CGRectGetMidX(self.view.frame)/2,  self.view.frame.size.height*0.25)];
    //[bezierPath closePath];
    
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = [bezierPath CGPath];
    shapLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    shapLayer.fillColor = [UIColor clearColor].CGColor;
    //shapLayer.lineDashPattern = lengths;
    shapLayer.lineWidth = 4.0f;
    //shapLayer.lineDashPattern = lengths;
    shapLayer.frame = self.view.bounds;
    
    [self.view.layer addSublayer:shapLayer];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
//    
//    [progressView startAnimating];
//    [self simulateProgress];
}

- (void)addProgress {
    
    CGRect frame = CGRectMake(0, 22.0f, CGRectGetWidth(self.view.bounds), 1.0f);
    progressView = [[QDGradientView alloc] initWithFrame:frame];
    
    UIView *view = [self view];
    [view setBackgroundColor:[UIColor blackColor]];
    [view addSubview:progressView];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
  
    [self addShap];
    //[self bezierpath];
    //[self addProgress];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)simulateProgress{

    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        
        CGFloat increment = (arc4random() % 5) / 10.0f + 0.1;
        CGFloat progress = [progressView progress] + increment;
        [progressView setProgress:progress];
        if (progress < 1.0) {
            [self simulateProgress];
        }
    });
}

//- (UIStatusBarStyle)preferredStatusBarStyle{
//
//    return UIStatusBarStyleLightContent;
//}

@end
