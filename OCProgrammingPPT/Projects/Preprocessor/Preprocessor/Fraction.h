//
//  Fraction.h
//  Preprocessor
//
//  Created by trainer on 12/18/15.
//  Copyright © 2015 trainer. All rights reserved.
//
#define Fraction(x,y) setTo:x over:y
#import <Foundation/Foundation.h>

@interface Fraction : NSObject
@property NSInteger numerator,denominator;
-(void)setTo:(NSInteger)n over:(NSInteger)d;

@end
