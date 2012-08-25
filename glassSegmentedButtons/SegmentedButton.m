//
//  SegmentedButton.m
//  themeParkRides
//
//  Created by Keiran Paster on 8/23/12.
//  Copyright (c) 2012 student. All rights reserved.
//

#import "SegmentedButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation SegmentedButton
@synthesize buttonPressActionHandler;

- (void)initWithTitles:(NSArray *)buttonTitles buttonTintNormal:(UIColor *)backgroundColorNormal buttonTintPressed:(UIColor *)backgroundColorPressed actionHandler:(void (^)(int buttonIndex))actionHandler {
    buttons = [[NSMutableArray alloc] init];
    int numberOfButtons = [buttonTitles count];
    for (int i = 0; i < numberOfButtons; i++) {
        UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
        newButton.frame = CGRectMake(i * (self.frame.size.width/numberOfButtons), 0, self.frame.size.width/numberOfButtons, self.frame.size.height);
        newButton.layer.bounds = CGRectMake(0, 0, self.frame.size.width/numberOfButtons, self.frame.size.height);
        newButton.layer.borderWidth = .5;
        newButton.layer.borderColor = [UIColor colorWithWhite:.6 alpha:1].CGColor;
        newButton.backgroundColor = backgroundColorNormal;
        newButton.clipsToBounds = YES;
        newButton.layer.masksToBounds = YES;
        
        CAGradientLayer *shineLayer = [CAGradientLayer layer];
        shineLayer.frame = newButton.layer.bounds;
        shineLayer.colors = [NSArray arrayWithObjects:
        (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
        (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
        (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
        (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
        (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
        nil];
        shineLayer.locations = [NSArray arrayWithObjects:
        [NSNumber numberWithFloat:0.0f],
        [NSNumber numberWithFloat:0.5f],
        [NSNumber numberWithFloat:0.5f],
        [NSNumber numberWithFloat:0.8f],
        [NSNumber numberWithFloat:1.0f],
        nil];
        [newButton.layer addSublayer:shineLayer];
        
        [newButton addTarget:self action:@selector(buttonUp:event:) forControlEvents:(UIControlEventTouchUpOutside|UIControlEventTouchUpInside|UIControlEventTouchCancel|UIControlEventTouchDragExit)];
        [newButton addTarget:self action:@selector(buttonDown:event:) forControlEvents:UIControlEventTouchDown|UIControlEventTouchDragEnter];
        [newButton addTarget:self action:@selector(buttonPressed:event:) forControlEvents:UIControlEventTouchUpInside];
        newButton.titleLabel.text = [buttonTitles objectAtIndex:i];
        [newButton setTitle:[buttonTitles objectAtIndex:i] forState:UIControlStateNormal];
        newButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        newButton.titleLabel.shadowOffset = CGSizeMake(0, -1);
        
        const CGFloat *componentColors = CGColorGetComponents(backgroundColorNormal.CGColor);
        CGFloat colorBrightness = ((componentColors[0] * 299) + (componentColors[1] * 587) + (componentColors[2] * 114)) / 1000;
        if (colorBrightness < 0.5) {
            [newButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [newButton setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
        } else {
            [newButton setTitleColor:[UIColor colorWithWhite:.2 alpha:1] forState:UIControlStateNormal];
            [newButton setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        
        
        
        [self addSubview:newButton];
        [buttons addObject:newButton];
        buttonBackgroundColorForStateNormal = backgroundColorNormal;
        buttonBackgroundColorForStatePressed = backgroundColorPressed;
    }
    self.layer.cornerRadius = 10;
    self.layer.borderColor = [UIColor colorWithWhite:.6 alpha:1].CGColor;
    self.layer.borderWidth = 1;
    self.clipsToBounds = YES;
    buttonPressActionHandler = [actionHandler copy];
}

- (void)initWithImages:(NSArray *)buttonImages buttonTintNormal:(UIColor *)backgroundColorNormal buttonTintPressed:(UIColor *)backgroundColorPressed actionHandler:(void (^)(int buttonIndex))actionHandler {
    buttons = [[NSMutableArray alloc] init];
    int numberOfButtons = [buttonImages count];
    for (int i = 0; i < numberOfButtons; i++) {
        UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
        newButton.frame = CGRectMake(i * (self.frame.size.width/numberOfButtons), 0, self.frame.size.width/numberOfButtons, self.frame.size.height);
        newButton.layer.bounds = CGRectMake(0, 0, self.frame.size.width/numberOfButtons, self.frame.size.height);
        newButton.layer.borderWidth = .5;
        newButton.layer.borderColor = [UIColor colorWithWhite:.6 alpha:1].CGColor;
        newButton.backgroundColor = backgroundColorNormal;
        newButton.clipsToBounds = YES;
        newButton.layer.masksToBounds = YES;
        
        CAGradientLayer *shineLayer = [CAGradientLayer layer];
        shineLayer.frame = newButton.layer.bounds;
        shineLayer.colors = [NSArray arrayWithObjects:
                             (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                             (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                             (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                             (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                             (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                             nil];
        shineLayer.locations = [NSArray arrayWithObjects:
                                [NSNumber numberWithFloat:0.0f],
                                [NSNumber numberWithFloat:0.5f],
                                [NSNumber numberWithFloat:0.5f],
                                [NSNumber numberWithFloat:0.8f],
                                [NSNumber numberWithFloat:1.0f],
                                nil];
        [newButton.layer addSublayer:shineLayer];
        
        [newButton addTarget:self action:@selector(buttonUp:event:) forControlEvents:(UIControlEventTouchUpOutside|UIControlEventTouchUpInside|UIControlEventTouchCancel|UIControlEventTouchDragExit)];
        [newButton addTarget:self action:@selector(buttonDown:event:) forControlEvents:UIControlEventTouchDown|UIControlEventTouchDragEnter];
        [newButton addTarget:self action:@selector(buttonPressed:event:) forControlEvents:UIControlEventTouchUpInside];
        [newButton setImage:[buttonImages objectAtIndex:i] forState:UIControlStateNormal];
        
        [self addSubview:newButton];
        [buttons addObject:newButton];
        buttonBackgroundColorForStateNormal = backgroundColorNormal;
        buttonBackgroundColorForStatePressed = backgroundColorPressed;
    }
    self.layer.cornerRadius = 10;
    self.layer.borderColor = [UIColor colorWithWhite:.6 alpha:1].CGColor;
    self.layer.borderWidth = 1;
    self.clipsToBounds = YES;
    buttonPressActionHandler = [actionHandler copy];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //nothing
    }
    return self;
}

- (void)buttonUp:(id)aButton event:(id)event {
    UIButton *button = (UIButton *)aButton;
    [button setBackgroundColor:buttonBackgroundColorForStateNormal];
}

- (void)buttonPressed:(id)aButton event:(id)event {
    if (buttonPressActionHandler) {
        for (int i = 0; i < [buttons count]; i++) {
            if (aButton == [buttons objectAtIndex:i]) {
                buttonPressActionHandler(i);
            }
        }
    }
}


- (void)buttonDown:(id)aButton event:(id)event {
	UIButton *button = (UIButton *)aButton;
    [button setBackgroundColor:buttonBackgroundColorForStatePressed];
}

- (void)setButtonPressActionHandler:(void (^)(int buttonIndex))actionHandler {
    buttonPressActionHandler = [actionHandler copy];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
