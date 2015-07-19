//
//  QDGradientView.m
//  Quartz2DDemo
//
//  Created by jiajingjing on 15/7/1.
//  Copyright (c) 2015年 jiajingjing. All rights reserved.
//

#import "QDGradientView.h"

@implementation QDGradientView

@synthesize animating, progress;

+ (Class)layerClass{

    return [CAGradientLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{

    if ((self = [super initWithFrame:frame])) {
        
        CAGradientLayer *layer = (id)[self layer];
        [layer setStartPoint:CGPointMake(0.0, 0.5)];
        [layer setEndPoint:CGPointMake(1.0, 0.5)];
        
        NSMutableArray *colors = [NSMutableArray array];
        for (NSInteger deg = 0; deg <= 360; deg += 5) {
            UIColor *color;
            color = [UIColor colorWithHue:1.0 * deg / 360.0
                               saturation:1.0
                               brightness:1.0
                                    alpha:1.0];
            [colors addObject:(id)[color CGColor]];
        }
        [layer setColors:[NSArray arrayWithArray:colors]];
        
        maskLayer = [CALayer layer];
        [maskLayer setFrame:CGRectMake(0, 0, 0, frame.size.height)];
    }
    return self;
}



- (void)setProgress:(CGFloat)value{

    if (progress != value) {
        
        progress = MIN(1.0, fabs(value));
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews{
 
    CGRect maskRect = [maskLayer frame];
    maskRect.size.width = CGRectGetWidth([self bounds]) * progress;
    [maskLayer setFrame:maskRect];
}

- (NSArray *)shiftColors:(NSArray *)colors{

    NSMutableArray *mutalble = [colors mutableCopy];
    id last = [mutalble lastObject];
    [mutalble removeLastObject];
    [mutalble insertObject:last atIndex:0];
    
    return [NSArray arrayWithArray:mutalble];
}

- (void)performAnimation{

    CAGradientLayer *layer = (id)[self layer];
    NSMutableArray *mutable = [[layer colors] mutableCopy];
    id lastColor = [mutable lastObject];
    [mutable removeLastObject];
    [mutable insertObject:lastColor atIndex:0];
    NSArray *shiftedColors = [NSArray arrayWithArray:mutable];
    
    [layer setColors:shiftedColors];
    
    CABasicAnimation *animation;
    animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    [animation setToValue:shiftedColors];
    [animation setDuration:0.08];
    [animation setRemovedOnCompletion:YES];
    [animation setFillMode:kCAFillModeBackwards];
    [animation setDelegate:self];
    [layer addAnimation:animation forKey:@"animationGradient"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

    if ([self isAnimating]) {
        [self performAnimation];
    }
}

- (void)startAnimating{

    if (![self isAnimating]) {
        animating = YES;
        
        [self performAnimation];
    }
}

- (void)stopAnimatring{

    if ([self isAnimating]) {
        animating = NO;
    }
}

@end
