//
//  TesseractController.m
//  BillFold
//
//  Created by Mikee Pourhadi on 7/4/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

#import "TesseractController.h"
#import "tesseract.h"
@implementation TesseractController

static Tesseract *_tesseract = nil;
+ (void)recognizeImage:(NSString*)imageName
{
    Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
    _tesseract = tesseract;
    [tesseract setVariableValue:@"$0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,:-()" forKey:@"tessedit_char_whitelist"];
    
    UIImage *image = [UIImage imageNamed:imageName];
    [tesseract setImage:image];
    NSLog(@"%@", [tesseract recognizedText]);
    
}

@end
