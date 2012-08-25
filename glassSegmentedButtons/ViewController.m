//
//  ViewController.m
//  glassSegmentedButtons
//
//  Created by Keiran Paster on 8/24/12.
//  Copyright (c) 2012 Keiran Paster. All rights reserved.
//

#import "ViewController.h"
#import "SegmentedButton.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize segmentedButtonView;
@synthesize imageSegmentedButton;

- (void)viewDidLoad
{
    [segmentedButtonView initWithTitles:[NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil] buttonTintNormal:[UIColor colorWithWhite:.9 alpha:1] buttonTintPressed:[UIColor colorWithWhite:.8 alpha:1] actionHandler:^(int buttonIndex) {
        NSLog(@"Button pressed at index %i", buttonIndex);
    }];
    [imageSegmentedButton initWithImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"settings"], [UIImage imageNamed:@"settings"], [UIImage imageNamed:@"settings"], [UIImage imageNamed:@"settings"], nil] buttonTintNormal:[UIColor colorWithWhite:.9 alpha:1] buttonTintPressed:[UIColor colorWithWhite:.8 alpha:1] actionHandler:^(int buttonIndex) {
        NSLog(@"Button pressed at index %i", buttonIndex);
    }];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setSegmentedButtonView:nil];
    [self setImageSegmentedButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
