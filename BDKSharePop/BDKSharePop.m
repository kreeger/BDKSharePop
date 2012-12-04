//
//  BDKSharePop.m
//  Created by Benjamin Kreeger on 12/4/12.
//

#import "BDKSharePop.h"
#import "BDKDrawing.h"

#import <QuartzCore/QuartzCore.h>

@implementation BDKSharePop 

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    // Because Quartz loves us...
    self.layer.cornerRadius = 5.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.layer.opacity = 0.95f;
    
    // Because it doesn't...
    CGContextRef c = UIGraphicsGetCurrentContext();
    drawGradient(c, rect, [UIColor darkGrayColor].CGColor, [UIColor blackColor].CGColor);
    
    CGRect glossRect = rect;
    glossRect.size.height = floorf(glossRect.size.height / 1.25f);
    drawGradient(c, glossRect, [UIColor colorWithWhite:0.25f alpha:0.65f].CGColor, [UIColor colorWithWhite:0.25f alpha:0.0f].CGColor);
    
    CGContextRelease(c);
}

@end
