//
//  QDGradientView.h
//  Quartz2DDemo
//
//  Created by jiajingjing on 15/7/1.
//  Copyright (c) 2015年 jiajingjing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QDGradientView : UIView{

    CALayer *maskLayer;
}

@property (nonatomic, readonly, getter=isAnimating) BOOL animating;
@property (nonatomic, readwrite, assign) CGFloat progress;

- (void)startAnimating;
- (void)stopAnimatring;

@end
