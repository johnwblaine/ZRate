//
//  Star.m
//  ZRate
//
//  Created by Wiphu (Jong) Blaine on 24/10/2562 BE.
//  Copyright © 2562 Wiphu (Jong) Blaine. All rights reserved.
//

#import "Star.h"

@implementation Star

- (id)initWithFrame:(CGRect)frame {
        self = [super initWithFrame:frame];
        if (self) {
            self.rate = 1.0;
            self.previousRate = 0.0;

            self.starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.starBtn setUserInteractionEnabled:false];
            [self.starBtn setTitle:@"⭑" forState:UIControlStateNormal];
            [self addSubview:self.starBtn];
            
            self.layer.cornerRadius = 10;
            self.clipsToBounds = true;
        }
        return self;
    }

- (void) functionName:(UIButton *) sender {

    if ( self.rate == 1.0 ){
        [self paint:0.0];
    } else {
        [self paint:1.0];
    }
}

- (void)layoutSubviews {
        [super layoutSubviews];
   
        int w = [self bounds].size.width;
        int h = [self bounds].size.height;
        float b =  (w + h) * 0.03;

        [self.starBtn.titleLabel setFont:[UIFont systemFontOfSize:UIFont.systemFontSize * b]];
        self.starBtn.frame = CGRectMake( (w - h) * 0.5, h * 0.0, h * 1.0, h * 1.0 );
}
    
- (void)drawRect:(CGRect)rect {
    int w = [self bounds].size.width;
    int h = [self bounds].size.height;
    
    if ( self.rate == 0.0 ){
           CGContextRef ctx = UIGraphicsGetCurrentContext();
            UIColor *c = [UIColor colorWithRed:0xb4/255.0f green:0xb4/255.0f blue:0xb4/255.0f alpha:1.0f];

           CGRect r = CGRectMake( 0, 0, w * 1.0, h * 1.0 );
           CGContextAddRect( ctx, r);
           CGContextStrokePath(ctx);
           CGContextSetFillColorWithColor(ctx, c.CGColor);
           CGContextFillRect( ctx, r);
        
    } else {
           CGContextRef ctx = UIGraphicsGetCurrentContext();
           UIColor *c = [UIColor colorWithRed:0xff/255.0f green:0xa5/255.0f blue:0x00/255.0f alpha:1.0f];

           CGRect r1 = CGRectMake( 0, 0, w * self.rate, h * 1.0 );
           CGContextAddRect(ctx, r1);
           CGContextStrokePath(ctx);
           CGContextSetFillColorWithColor(ctx, c.CGColor);
           CGContextFillRect( ctx, r1);

           UIColor *g = [UIColor colorWithRed:0xb4/255.0f green:0xb4/255.0f blue:0xb4/255.0f alpha:1.0f];
           CGRect r2 = CGRectMake( w * self.rate, 0, w * (1 - self.rate), h * 1.0 );
           CGContextAddRect(ctx, r2);
           CGContextStrokePath(ctx);
           CGContextSetFillColorWithColor(ctx, g.CGColor);
           CGContextFillRect(ctx, r2);
    }
}

- (void)paint:(float)f {
    self.previousRate = self.rate;
    self.rate = f;
    [self setNeedsDisplay];
}

- (void)select {
    
    if ( self.rate == 0.0 ){
        self.rate = 1.0;
    } else {
        self.rate = 0.0;
    }
    
    [self setNeedsDisplay];
}

- (void)rollback {
    if ( self.rate != self.previousRate ){
        self.rate = self.previousRate;
        [self setNeedsDisplay];
    }
}

@end
