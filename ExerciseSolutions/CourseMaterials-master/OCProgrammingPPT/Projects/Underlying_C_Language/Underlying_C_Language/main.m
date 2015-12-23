//
//  main.m
//  Underlying_C_Language
//
//  Created by trainer on 12/19/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <search.h>
#include <search.h>
struct {
    int day;
    int month;
    int year;
} dates[100];

int main(int argc, const char * argv[]) {
    struct entry dictionary[100] =
    { { "aardvark", "a burrowing African mammal" } ,
        { "abyss", "a bottomless pit" } ,
        { "acumen", "mentally sharp; keen" } ,
        { "addle", "to become confused" } ,
        { "aerie", "a high nest" } ,
        { "affix", "to append; attach" } ,
        { "agar", "a jelly made from seaweed" } ,
        { "ahoy", "a nautical call of greeting" } ,
        { "aigrette", "an ornamental cluster of feathers" } ,
        { "ajar", "partially opened" } } ;
    int entries = 10;
    int entryNumber;
    int lookup (struct entry dictionary [], char search[],
                int entries);
    if ( argc != 2 )
    {
        NSLog (@"No word typed on the command line.");
        return (1);
    }
    entryNumber = lookup (dictionary, argv[1], entries);
    if ( entryNumber != -1 )
        NSLog (@"%s", dictionary[entryNumber].definition);
    else
        NSLog (@"Sorry, %s is not in my dictionary.", argv[1]);
    return (0);

}
