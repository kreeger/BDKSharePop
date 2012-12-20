//
//  BDKSharePopController.m
//  Created by Benjamin Kreeger on 12/20/12.
//

#import "BDKSharePopController.h"
#import "BDKSharePopBackgroundView.h"
#import <QuartzCore/QuartzCore.h>

@interface BDKSharePopController ()

@property (strong, nonatomic) BDKSharePopBackgroundView *backgroundView;
@property (strong, nonatomic) BDKSharePopView *sharePop;
@property (strong, nonatomic) UIImageView *imposterView;

@end

@implementation BDKSharePopController

- (id)init {
    if ((self = [super init])) {
        self.modalPresentationStyle = UIModalPresentationFormSheet;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.wantsFullScreenLayout = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.sharePop];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Grab a snapshot of the parent view.
    UIGraphicsBeginImageContext(self.presentingViewController.view.bounds.size);
    [self.presentingViewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *parentViewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Insert our imposter image view at the back of our stack.
    self.imposterView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imposterView.image = parentViewImage;
    [self.view insertSubview:self.imposterView atIndex:0];
    
    [UIView animateWithDuration:0.2f animations:^{
        _backgroundView.alpha = 0.4f;
    } completion:nil];
    
    [UIView animateWithDuration:0.4f animations:^{
        _sharePop.frame = CGRectOffset(_sharePop.frame, 0.0f, -(CGRectGetHeight(_sharePop.frame) + 30.0f));
    } completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [UIView animateWithDuration:0.2f animations:^{
        _backgroundView.alpha = 0.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.2f animations:^{
        _sharePop.frame = CGRectOffset(_sharePop.frame, 0.0f, CGRectGetHeight(_sharePop.frame) + 30.0f);
    } completion:nil];
    
    [self.imposterView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (!self.view.superview) {
        self.backgroundView = nil;
        self.sharePop = nil;
        self.imposterView = nil;    
    }
}

#pragma mark - Properties

- (BDKSharePopBackgroundView *)backgroundView {
    if (_backgroundView != nil) return _backgroundView;
    _backgroundView = [BDKSharePopBackgroundView backgroundViewForFrame:self.view.frame];
    _backgroundView.alpha = 0.0f;
    return _backgroundView;
}

- (BDKSharePopView *)sharePop {
    if (_sharePop != nil) return _sharePop;
    CGRect frame = CGRectMake(0.0f, self.view.frame.size.height / 2.0f, self.view.frame.size.width,
                              self.view.frame.size.height / 2.0f);
    frame = CGRectInset(frame, 15.0f, 15.0f);
    frame = CGRectOffset(frame, 0.0f, CGRectGetHeight(frame));
    _sharePop = [[BDKSharePopView alloc] initWithFrame:frame];
    return _sharePop;
}

@end
