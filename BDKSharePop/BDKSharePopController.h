//
//  BDKSharePopController.h
//  Created by Benjamin Kreeger on 12/20/12.
//

#import <UIKit/UIKit.h>
#import "BDKSharePopView.h"

@protocol BDKSharePopControllerDelegate;

@interface BDKSharePopController : UIViewController <BDKSharePopDelegate>

@property (weak, nonatomic) id<BDKSharePopControllerDelegate> delegate;

- (id)initWithDelegate:(id<BDKSharePopControllerDelegate>)delegate;

@end

@protocol BDKSharePopControllerDelegate <NSObject>

- (void)sharePopControllerWantsDismissal:(BDKSharePopController *)controller;

@end
