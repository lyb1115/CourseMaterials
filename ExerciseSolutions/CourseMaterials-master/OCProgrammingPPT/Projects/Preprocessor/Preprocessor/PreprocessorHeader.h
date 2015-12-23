//
//  PreprocessorHeader.h
//  Preprocessor
//
//  Created by trainer on 12/18/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#ifndef PreprocessorHeader_h
#define PreprocessorHeader_h


#endif /* PreprocessorHeader_h */

#define Max(a,b) ( a > b ? a : b )


#define Is_Lower_Case(x)  x > 'a' && x < 'z'

#define IS_LOWER_CASE(x) ( ((x) >= 'a') && ((x) <= 'z') )

#define To_Upper_Case(x)  Is_Lower_Case(x) ? (x - 'a' + 'A')  :\
x

#define IPAD

#if defined IPAD
#define Device_Identity @"IPAD"
#else
#define Device_Identity @"IPHONE"
#endif

#ifdef IPAD
#define Device_Identity @"IPAD"
#else
#define Device_Identity @"IPHONE"
#endif





 