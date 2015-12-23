//
//  ViewController.m
//  Preprocessor
//
//  Created by trainer on 12/18/15.
//  Copyright © 2015 trainer. All rights reserved.
//
#import "Calculator.h"
#import "ViewController.h"
#import "Fraction.h"
#import "PreprocessorHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Fraction *frac = [[Fraction alloc] init];
    [ frac Fraction(1, 3) ];
    NSLog(@"%ld/%ld",(long)frac.numerator,(long)frac.denominator);
    NSLog(@"%i",Max(3, 1));
    
    //int a = 5,b = 9, c;
    //c =  a > b ? a : b;
    
    if (Is_Lower_Case('B')) {
        NSLog(@"lower case");
    }  else {
        NSLog(@"bigger case");
    }
    Is_Lower_Case('a' + 'b');
   // ('a' + 'b') <= 'z' && 'a' + 'b' >= 'a';
    
    if (IS_LOWER_CASE('a' + 'c' - 'b')) {
        NSLog(@"lower case");
    }  else {
        NSLog(@"bigger case");
    }

    float a = 1.0;
    NSLog(@"%c",To_Upper_Case('c')) ;
    NSLog(@"%@",Device_Identity);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
