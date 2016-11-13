//
//  DJViewController.m
//  DJMacros
//
//  Created by Deju Liu on 11/08/2016.
//  Copyright (c) 2016 Deju Liu. All rights reserved.
//

#import "DJViewController.h"
#import "DJSO.h"

@protocol DJViewControllerDelegate <NSObject>



@end

@interface DJViewController ()<DJViewControllerDelegate>

PP_DELEGATE(DJViewControllerDelegate, delegate)

@end

@implementation DJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    
}

@end
