//
//  TesseractController.h
//  BillFold
//
//  Created by Mikee Pourhadi on 7/4/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TesseractController : NSObject
+ (NSString*)recognizeImage:(NSString*)image;
+ (id)regexDo:(NSString*)foodString;
@end
