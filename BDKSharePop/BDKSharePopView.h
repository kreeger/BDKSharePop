//
//  BDKSharePop.h
//  Created by Benjamin Kreeger on 12/4/12.
//

#import <UIKit/UIKit.h>

@protocol BDKSharePopDelegate;

@interface BDKSharePopView : UIView

@property (weak, nonatomic) id<BDKSharePopDelegate> delegate;

@end

@protocol BDKSharePopDelegate <NSObject>



@end