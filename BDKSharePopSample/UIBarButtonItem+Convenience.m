#import "UIBarButtonItem+Convenience.h"

@implementation UIBarButtonItem (Convenience)

+ (UIBarButtonItem *)flexibleSpace {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}

@end
