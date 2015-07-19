//
//  QDView.m
//  Quartz2DDemo
//
//  Created by jiajingjing on 15/6/30.
//  Copyright (c) 2015年 jiajingjing. All rights reserved.
//

#import "QDView.h"

@implementation QDView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawTheFlag:(CGRect)rect {
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(cxt, 0.5f);
    CGContextSetStrokeColorWithColor(cxt, [UIColor orangeColor].CGColor);
    
    CGContextAddRect(cxt, rect);
    CGContextSetFillColorWithColor(cxt, [UIColor orangeColor].CGColor);
    
    CGContextMoveToPoint(cxt, 0, 0);
    CGContextAddLineToPoint(cxt, rect.size.width, rect.size.height);
    
    CGContextMoveToPoint(cxt, rect.size.width, 0);
    CGContextAddLineToPoint(cxt, 0, rect.size.height);
    
    CGContextMoveToPoint(cxt, 0, rect.size.height/2);
    CGContextAddLineToPoint(cxt, rect.size.width, rect.size.height/2);
    
    CGContextMoveToPoint(cxt, rect.size.width/2, 0);
    CGContextAddLineToPoint(cxt, rect.size.width/2, rect.size.height);
    
    //CGContextFillPath(cxt);
    CGContextStrokePath(cxt);
    
}

- (void)drawEllipse:(CGRect)rect {
    //[self drawTheFlag:rect];
    
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(cxt, 1.0f);
    CGContextSetStrokeColorWithColor(cxt, [UIColor orangeColor].CGColor);
    
    
    const CGFloat lengths[] = {4.0f,2.0f,4.0f};
    CGContextSetLineDash(cxt, 0, lengths, 3); //设置虚线的样式
    
    CGContextAddEllipseInRect(cxt, rect);
    
    CGContextAddEllipseInRect(cxt, CGRectMake(rect.size.width/6, rect.size.height/6, rect.size.width/3, rect.size.height/3));
    
    CGContextAddEllipseInRect(cxt, CGRectMake(rect.size.width/4, rect.size.height/4, rect.size.width/2, rect.size.height/2));
    
    CGContextStrokePath(cxt);
}

- (void)drawCircle:(CGRect)rect {
    //[self drawEllipse:rect];
    
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(cxt, 1.0f);
    CGContextSetStrokeColorWithColor(cxt, [UIColor brownColor].CGColor);
    
    const CGFloat lengths[] = {4.0f,2.0f,4.0f};
    CGContextSetLineDash(cxt, 0, lengths, 3); //设置虚线的样式
    
    CGContextAddArc(cxt, rect.size.width/2, rect.size.height/2, rect.size.width/4, 0, M_PI*2, 1);
    
    CGContextStrokePath(cxt);
}

- (void)drawCurve:(CGRect)rect {
    //[self drawEllipse:rect];
    
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(cxt, 1.0f);
    CGContextSetStrokeColorWithColor(cxt, [UIColor brownColor].CGColor);
    
    
    CGContextMoveToPoint(cxt, rect.size.width/2, 0);
    CGContextAddCurveToPoint(cxt, 0 , rect.size.height*0.2, rect.size.width, rect.size.height*0.8, rect.size.width/2, rect.size.height);
    
    CGContextStrokePath(cxt);
}

//绘制圆形进度条
- (void)drawCircleProgress {
    
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    CGRect allRect = self.bounds;
    CGRect circleRect = CGRectInset(allRect, 2.0f, 2.0f);
    
    CGContextSetRGBFillColor(cxt, 1.0f, 1.0f, 1.0f, 1.0f);
    CGContextSetRGBStrokeColor(cxt, 1.0f, 1.0f, 1.0f, 0.1f);
    CGContextSetLineWidth(cxt, 2.0f);
    CGContextFillEllipseInRect(cxt, circleRect);
    CGContextStrokeEllipseInRect(cxt, circleRect);
    
    CGPoint center = CGPointMake(allRect.size.width/2, allRect.size.height/2);
    CGFloat radius = (allRect.size.width - 4) / 2;
    CGFloat startAngle = - ((float)M_PI / 2);
    CGFloat endAngle = (78 *2 * (float)M_PI) + startAngle;
    //CGContextSetRGBFillColor(cxt, 1.0f, 1.0f, 1.0f, 1.0f);
    CGContextSetFillColorWithColor(cxt, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(cxt, center.x, center.y);
    CGContextAddArc(cxt, center.x, center.y, radius, startAngle, M_PI, 0);
    CGContextClosePath(cxt);
    CGContextFillPath(cxt);
}
//绘制长条形进度条
- (void)DrawProgress:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat width,height,xOffset,yOffset;
    width = rect.size.width-30;
    height = 50;
    xOffset = 5;
    yOffset = 5;
    
    // Center HUD
    CGRect allRect = self.bounds;
    // Draw rounded HUD bacgroud rect
    CGRect boxRect = CGRectMake(roundf((allRect.size.width - width) / 2) + xOffset,
                                roundf((allRect.size.height - height) / 2) + yOffset, width, height);
    // Corner radius
    float radius = height/2;
    
    CGContextBeginPath(context);
    CGContextSetGrayFillColor(context, 0.0f, 0.75);
    CGContextMoveToPoint(context, CGRectGetMinX(boxRect) + radius, CGRectGetMinY(boxRect));
    CGContextAddArc(context, CGRectGetMaxX(boxRect) - radius, CGRectGetMinY(boxRect) + radius, radius, 3 * (float)M_PI / 2, 0, 0);
    CGContextAddArc(context, CGRectGetMaxX(boxRect) - radius, CGRectGetMaxY(boxRect) - radius, radius, 0, (float)M_PI / 2, 0);
    CGContextAddArc(context, CGRectGetMinX(boxRect) + radius, CGRectGetMaxY(boxRect) - radius, radius, (float)M_PI / 2, (float)M_PI, 0);
    CGContextAddArc(context, CGRectGetMinX(boxRect) + radius, CGRectGetMinY(boxRect) + radius, radius, (float)M_PI, 3 * (float)M_PI / 2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
}

- (void)Draw3D:(CGRect)rect {
    //[self DrawProgress:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 4.0f);
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    
    CGContextMoveToPoint(context, rect.size.width/2, rect.origin.y+20);
    CGContextAddLineToPoint(context, 10, rect.size.height/2);
    CGContextAddLineToPoint(context, rect.size.width-20, rect.size.height/2);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    //CGContextSetStrokePattern(context, CGPatternRef pattern, const CGFloat *components)
    
    CGContextTranslateCTM(context, 100, 50);
    
    CGContextClosePath(context);
    
    CGContextStrokePath(context);
}

- (void)drawClipShap:(CGRect)rect {
    
    CGFloat w = CGRectGetWidth(rect);
    CGFloat h = CGRectGetHeight(rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor brownColor].CGColor);
    
    CGContextBeginPath (context);
    CGContextAddArc (context, w/2, h/2, ((w>h) ? h : w)/2, 0, 2*M_PI, 0);
    CGContextClosePath (context);
    CGContextStrokePath(context);
    CGContextClip (context);
}

- (void)drawRect:(CGRect)rect{

    CGContextRef context = UIGraphicsGetCurrentContext();

    UIImage *logo = [UIImage imageNamed:@"berry.jpg"];
    CGRect bounds = CGRectMake(0.0f, 0.0f,rect.origin.x + rect.size.width, rect.origin.y + rect.size.width);
    // Create a new path
    CGMutablePathRef path = CGPathCreateMutable();
    
    // Add circle to path
    CGPathAddEllipseInRect(path, NULL, bounds);//这句话就是剪辑作用
    CGContextAddPath(context, path);
    
    //CGContextScaleCTM(context, .5, .75);
    // Clip to the circle and draw the logo
    CGContextClip(context);
    [logo drawInRect:bounds];
    CFRelease(path);
}

@end
