//
//  ViewController.h
//  glassSegmentedButtons
//
//  Created by Keiran Paster on 8/24/12.
//  Copyright (c) 2012 Keiran Paster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentedButton.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet SegmentedButton *segmentedButtonView;
@property (strong, nonatomic) IBOutlet SegmentedButton *imageSegmentedButton;

@end
