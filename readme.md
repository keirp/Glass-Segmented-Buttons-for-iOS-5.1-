# Segmented Glass Buttons
#### Native Segmented Buttons for iOS 5.1

- No images needed, just supply UIColors for the buttons.
- Can work with interface builder, just subclass a UIView object.

#### Instructions

1. Import "SegmentedButton.h" into your view controller.
2. In interface builder, put a UIView into your view controller and change it's class to SegmentedButton.
3. Be sure to import the QuartzCore framework into your project.
4. In your view controller in the viewDidLoad method, set the button up either using UIImages or NSStrings.

#### Example Code:
	[segmentedButtonView initWithTitles:[NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil] 
	buttonTintNormal:[UIColor colorWithWhite:.9 alpha:1] 
	buttonTintPressed:[UIColor colorWithWhite:.8 alpha:1] 
	actionHandler:^(int buttonIndex) {
        NSLog(@"Button pressed at index %i", buttonIndex);
    }];