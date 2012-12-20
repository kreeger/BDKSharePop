//
//  BDKSharePopController.m
//  Created by Benjamin Kreeger on 12/20/12.
//

#import "BDKSharePopController.h"
#import "BDKSharePopBackgroundView.h"

#import <QuartzCore/QuartzCore.h>

@interface BDKSharePopController ()

@property (strong, nonatomic) BDKSharePopView *sharePop;
@property (strong, nonatomic) UIImageView *imposterView;
@property (strong, nonatomic) UIButton *imposterViewButton;

- (void)imposterViewButtonTapped:(UIButton *)sender;

@end

@implementation BDKSharePopController

- (id)init {
    return [self initWithDelegate:nil];
}

- (id)initWithDelegate:(id<BDKSharePopControllerDelegate>)delegate {
    if ((self = [super init])) {
        _delegate = delegate;
        self.modalPresentationStyle = UIModalPresentationCurrentContext;
        self.wantsFullScreenLayout = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.opaque = NO;
    self.view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.sharePop];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Grab a snapshot of the parent view.
    UIGraphicsBeginImageContext(self.presentingViewController.view.bounds.size);
    [self.presentingViewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *parentViewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Insert our imposter image view at the back of our stack.
    self.imposterView.image = parentViewImage;
    
    [self.view insertSubview:self.imposterView atIndex:0];
    [self.view insertSubview:self.imposterViewButton aboveSubview:self.imposterView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_imposterViewButton removeFromSuperview];
    [_imposterView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (!self.view.superview) {
        self.sharePop = nil;
        self.imposterView = nil;
        self.imposterViewButton = nil;
    }
}

#pragma mark - Properties

- (BDKSharePopView *)sharePop {
    if (_sharePop != nil) return _sharePop;
    CGRect frame = CGRectMake(0.0f, self.view.frame.size.height / 2.0f, self.view.frame.size.width,
                              self.view.frame.size.height / 2.0f);
    frame = CGRectInset(frame, 15.0f, 15.0f);
    _sharePop = [[BDKSharePopView alloc] initWithFrame:frame];
    return _sharePop;
}

- (UIImageView *)imposterView {
    if (_imposterView != nil) return _imposterView;
    _imposterView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    return _imposterView;
}

- (UIButton *)imposterViewButton {
    if (_imposterViewButton != nil) return _imposterViewButton;
    _imposterViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _imposterViewButton.frame = self.view.bounds;
    [_imposterViewButton addTarget:self action:@selector(imposterViewButtonTapped:)
                  forControlEvents:UIControlEventTouchUpInside];
    return _imposterViewButton;
}

#pragma mark - Events

- (void)imposterViewButtonTapped:(UIButton *)sender {
    [self.delegate sharePopControllerWantsDismissal:self];
}

@end
