//
//  Star.h
//  ZRate
//
//  Created by Wiphu (Jong) Blaine on 24/10/2562 BE.
//  Copyright © 2562 Wiphu (Jong) Blaine. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Star : UIView

@property (nonatomic, retain) UIButton *starBtn;

@property float previousRate;
@property float rate;
- (void)paint:(float)f;
- (void)rollback;
- (void)select;


@end

NS_ASSUME_NONNULL_END
