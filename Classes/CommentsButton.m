//
//  CommentsButton.m
//  Pods
//

#import "CommentsButton.h"

@interface CommentsButton()


@end

@implementation CommentsButton

- (void)setupButton{
    borderColor = self.titleLabel.textColor;
    circleLayer = [CAShapeLayer layer];
    circleLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    circleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    UIBezierPath *path = [UIBezierPath bezierPath];

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat cornerLength = MIN(width, height) / 10.0;
    CGFloat arrowLength = MIN(width, height) / 5.0;

    [path moveToPoint:CGPointMake(cornerLength, 0)];
    [path addLineToPoint:CGPointMake(width - cornerLength, 0)];
    [path addQuadCurveToPoint: CGPointMake(width, cornerLength)
                 controlPoint:CGPointMake(width, 0)];
    [path addLineToPoint:CGPointMake(width, height - cornerLength)];
    [path addQuadCurveToPoint:CGPointMake(width - cornerLength, height)
                 controlPoint:CGPointMake(width, height)];

    [path addLineToPoint:CGPointMake(width / 2.0, height)];
    [path addLineToPoint:CGPointMake(width / 2.0 - arrowLength * 4 / 3, height + arrowLength)];
    [path addLineToPoint:CGPointMake(width / 2.0 - arrowLength, height)];

    [path addLineToPoint:CGPointMake(cornerLength, height)];
    [path addQuadCurveToPoint:CGPointMake(0, height - cornerLength)
                 controlPoint:CGPointMake(0, height)];
    [path addLineToPoint:CGPointMake(0, cornerLength)];
    [path addQuadCurveToPoint:CGPointMake(cornerLength, 0)
                 controlPoint:CGPointMake(0, 0)];
    [path closePath];

    circleLayer.path = path.CGPath;
    path = nil;
    circleLayer.strokeColor = borderColor.CGColor;
    circleLayer.lineWidth = 2.0f;
    circleLayer.fillColor = nil;
    [[self layer] insertSublayer:circleLayer below:self.titleLabel.layer];
}

// make the touch area at least 60 pts wide
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;
{
    if (!self.enabled || self.hidden) {
        return NO;
    }

    CGFloat marginX = MIN(0, self.bounds.size.width - 60.0f);
    CGFloat marginY = MIN(0, self.bounds.size.height - 60.0f);

    CGRect area = CGRectInset(self.bounds, marginX, marginY);
    return CGRectContainsPoint(area, point);
}

@end
