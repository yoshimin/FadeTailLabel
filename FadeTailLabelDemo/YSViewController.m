//
//  YSViewController.m
//  FadeTailLabelDemo
//
//  Created by Shingai Yoshimi on 8/17/13.
//  Copyright (c) 2013 Shingai Yoshimi. All rights reserved.
//

#import "YSViewController.h"
#import "YSFadeTailLabel.h"

@interface YSViewController ()

@property (nonatomic, assign) IBOutlet YSFadeTailLabel *label;

@end

@implementation YSViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.label.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
}

@end
