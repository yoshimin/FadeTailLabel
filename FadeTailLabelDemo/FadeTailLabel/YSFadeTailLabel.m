//
//  YSFadeTailLabel.m
//  FadeTailLabelDemo
//
//  Created by Shingai Yoshimi on 8/17/13.
//  Copyright (c) 2013 Shingai Yoshimi. All rights reserved.
//

#import "YSFadeTailLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation YSFadeTailLabel

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)setText:(NSString *)text {
    
    [super setText:text];
    [self applyGradientMask];
}

- (void)setFrame:(CGRect)frame {
    
    [super setFrame:frame];
    [self applyGradientMask];
}

- (void)applyGradientMask {
    
    self.layer.mask = nil;
    
    CGFloat textWidth = [self.text sizeWithFont:self.font
                              constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGRectGetHeight(self.bounds))].width;
    
    //文字列の長さがUILabelの長さより短い場合は省略する必要がないのでリターン
    if (textWidth <= CGRectGetWidth(self.bounds)) {
        
        self.layer.mask = nil;
        return;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    //レイヤをビューの中央に配置する
    gradientLayer.bounds = self.layer.bounds;
    gradientLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    gradientLayer.startPoint = CGPointMake(0, CGRectGetMidY(self.frame));   //開始ポイント
    gradientLayer.endPoint = CGPointMake(1, CGRectGetMidY(self.frame));     //終了ポイント
    
    id opaque = (id)[UIColor blackColor].CGColor;       //開始色
    id transparent = (id)[UIColor clearColor].CGColor;  //終了色
    gradientLayer.colors = @[opaque, transparent];
    
    //それぞれの色のグラーデーションの終了ポイントを設定（0〜1）
    gradientLayer.locations = @[@0.9, @1];
    
    self.layer.mask = gradientLayer;
    
    return;
}

@end