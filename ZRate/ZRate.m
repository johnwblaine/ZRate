//
//  ZRate.m
//  ZRate
//
//  Created by Wiphu (Jong) Blaine on 24/10/2562 BE.
//  Copyright © 2562 Wiphu (Jong) Blaine. All rights reserved.
//

#import "ZRate.h"

@implementation ZRate
    

- (id)initWithFrame:(CGRect)frame {
        self = [super initWithFrame:frame];
        if (self) {
            self.star = [[NSMutableArray alloc] init];
            
            for ( int i = 0; i < 4; i++ ){
                Star *s = [[Star alloc] initWithFrame:CGRectZero];
                [self.star addObject:s];
                [self addSubview:s];
            }
            
            self.backgroundColor = [UIColor whiteColor];
            [self.layer setBorderColor:[[UIColor blackColor] CGColor]];
            [self.layer setBorderWidth:2.0];
        }
        return self;
    }

    - (void)layoutSubviews {
        [super layoutSubviews];
   
        int w = [self bounds].size.width;
        int h = [self bounds].size.height;
        float b = h * 0.8;
        float v = w * 0.25;

        for ( int i = 0; i < 4; i++ ){
            Star *s = [self.star objectAtIndex:i];
            s.frame = CGRectMake( (v * i) + ( (v - b ) * 0.5) , (h - b) * 0.5, b, b );
        }
        
        [self rating:2.5];
    }
    
    - (void)rating:(float) v {
        for ( int i = 0; i < 4; i++ ){
            Star *s = [self.star objectAtIndex:i];
            float n = v - i;
            
            if ( n > 1.0 ){
                [s paint:1.0];
            } else if ( n < 0 ){
                [s paint:0];
            } else {
                [s paint:n];
            }
        }
    }

- (void)reset {
    for ( int i = 0; i < 4; i++ ){
        Star *s = [self.star objectAtIndex:i];
        [s paint:0.0];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self reset];
    
    UITouch *touch = [[event allTouches] anyObject];
    self.start = [touch locationInView:self];
    NSLog( @"%f %f", self.start.x, self.start.y );
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    int w = [self bounds].size.width;

    UITouch *touch = [[event allTouches] anyObject];
    CGPoint e = [touch locationInView:self];
    
    [self rating:( (e.x/w) * 4)];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint e = [touch locationInView:self];
    CGFloat l = fabs(self.start.x - e.x);
    float w = [self frame].size.width;

    if ( l < 10.0 ){
        
        for ( int i = 0; i < 4; i++ ){
            Star *s = [self.star objectAtIndex:i];
            [s rollback];
        }
        
        if ( ( e.x/w ) > 0.75 ){
            Star *s = [self.star objectAtIndex:3];
            [s select];
        }else if ( ( e.x/w ) > 0.5){
            Star *s = [self.star objectAtIndex:2];
            [s select];

        }else if ( ( e.x/w ) > 0.25 ){
            Star *s = [self.star objectAtIndex:1];
            [s select];
        } else {
            Star *s = [self.star objectAtIndex:0];
            [s select];
        }
        
    } else {
        if ( (e.x/w) > 0.02 ){
            float f = round(( (e.x/w) * 4) + 0.5 );
            [self rating:f];
        } else {
            [self rating:0.0];
        }
        
    }
}

@end
