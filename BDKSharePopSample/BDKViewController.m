//
//  BDKViewController.m
//  Created by Benjamin Kreeger on 12/4/12.
//

#import "BDKViewController.h"

#import "BDKSharePop.h"

#import "UIBarButtonItem+Convenience.h"

@interface BDKViewController ()

@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UIBarButtonItem *shareItem;
@property (strong, nonatomic) BDKSharePop *sharePop;

- (void)shareItemTapped:(UIBarButtonItem *)sender;

@end

@implementation BDKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"GrayJean.png"]];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [self.navigationController.toolbar setBarStyle:UIBarStyleBlackTranslucent];
    self.navigationController.toolbarHidden = NO;
    
    self.title = @"BDKSharePop Sample";
    self.toolbarItems = @[[UIBarButtonItem flexibleSpace], self.shareItem, [UIBarButtonItem flexibleSpace]];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.view addSubview:self.textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Properties

- (UITextView *)textView {
    if (_textView != nil) return _textView;
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    _textView.text = @"Or device resistor led with fragmentation debugged element capacitance normalizing resistor. Read-only read-only phaselock, developer backbone inversion encapsulated pc overflow computer broadband inversion. Disk silicon cable logarithmic device recursive indeterminate record read-only element processor. Port connectivity data frequency echo read-only, read-only partitioned record development logistically. Harmonic integral, feedback normalizing element element partitioned inversion. Or device resistor led with fragmentation debugged element capacitance normalizing resistor. Read-only read-only phaselock, developer backbone inversion encapsulated pc overflow computer broadband inversion. Disk silicon cable logarithmic device recursive indeterminate record read-only element processor. Port connectivity data frequency echo read-only, read-only partitioned record development logistically. Harmonic integral, feedback normalizing element element partitioned inversion.";
    _textView.font = [UIFont systemFontOfSize:16.0f];
    _textView.scrollEnabled = YES;
    _textView.backgroundColor = [UIColor clearColor];
    _textView.editable = NO;
    return _textView;
}

- (UIBarButtonItem *)shareItem {
    if (_shareItem != nil) return _shareItem;
    _shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                               target:self
                                                               action:@selector(shareItemTapped:)];
    return _shareItem;
}

- (BDKSharePop *)sharePop {
    if (_sharePop != nil) return _sharePop;
    CGRect frame = CGRectMake(10.0f, self.view.frame.size.height - 200.0f - 44.0f - 10.0f, 300.0f, 200.0f);
    _sharePop = [[BDKSharePop alloc] initWithFrame:frame];
    return _sharePop;
}

#pragma mark - Actions

- (void)shareItemTapped:(UIBarButtonItem *)sender {
    if (self.sharePop.superview) [self.sharePop removeFromSuperview];
    else [self.view addSubview:self.sharePop];
}

@end
