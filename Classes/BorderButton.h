//
//  BorderButton.h
//  Pods
//
//  Created by Frank Michael on 4/10/14.
//
//

#import <UIKit/UIKit.h>

@interface BorderButton : UIButton {
    CAShapeLayer *circleLayer;
    UIColor *borderColor;
}

@property (nonatomic) UIEdgeInsets hitTestEdgeInsets;

- (void)setupButton;

@end
