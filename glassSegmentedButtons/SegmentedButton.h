//
//  SegmentedButton.h
//  themeParkRides
//
//  Created by Keiran Paster on 8/23/12.
//  Copyright (c) 2012 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentedButton : UIView {
    UIColor *buttonBackgroundColorForStateNormal;
    UIColor *buttonBackgroundColorForStatePressed;
    NSMutableArray *buttons;
}
@property (nonatomic, copy) void (^buttonPressActionHandler)(int buttonIndex);
- (void)initWithTitles:(NSArray *)buttonTitles buttonTintNormal:(UIColor *)backgroundColorNormal buttonTintPressed:(UIColor *)backgroundColorPressed actionHandler:(void (^)(int buttonIndex))actionHandler;

- (void)initWithImages:(NSArray *)buttonImages buttonTintNormal:(UIColor *)backgroundColorNormal buttonTintPressed:(UIColor *)backgroundColorPressed actionHandler:(void (^)(int buttonIndex))actionHandler;
@end
