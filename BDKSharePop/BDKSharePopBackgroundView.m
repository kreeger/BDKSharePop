#import "BDKSharePopBackgroundView.h"

@implementation BDKSharePopBackgroundView

+ (id)backgroundViewForFrame:(CGRect)frame {
    return [[self alloc] initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.opaque = NO;
        self.contentMode = UIViewContentModeRedraw;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 0.0, 0.0, 0.0, 0.7,   // Start color
        0.0, 0.0, 0.0, 0.85 }; // End color
    
    CGColorSpaceRef rgbColorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
    CGGradientDrawingOptions options = kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation;
    CGFloat endRadius = [UIApplication sharedApplication].keyWindow.bounds.size.height / 2;
    CGContextDrawRadialGradient(currentContext, gradient, center, 20.0f, center, endRadius, options);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(rgbColorspace);
}

@end
