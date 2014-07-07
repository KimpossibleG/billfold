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
+ (NSString*)recognizeImage:(NSString*)imageName
{
    Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
    _tesseract = tesseract;
    [tesseract setVariableValue:@"$0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,:-()" forKey:@"tessedit_char_whitelist"];
    
    UIImage *image = [UIImage imageNamed:imageName];
    [tesseract setImage:image];
    return [tesseract recognizedText];
    
}

+ (NSMutableDictionary*)regexDo:(NSString*)foodString{
    // This is where we'll feed in our string from tesseract:
    NSString *string = foodString;
    
    // This allows us to use the error property:
    NSError *error = NULL;
    
    //This gives our pattern to match
    NSRegularExpression *regex = [NSRegularExpression
                        regularExpressionWithPattern:@"(.+)(\\$|\\s)(\\d*\\d*\\d*\\d*[.]\\d\\d)"
                                             options:NSRegularExpressionAnchorsMatchLines
                                               error:&error];
    
    // This gives us an array of our matches
    NSArray *matches = [regex matchesInString:string options:NSRegularExpressionAnchorsMatchLines range:NSMakeRange(0, string.length)];
    
    // Iterate through the matches and create a dictionary of food: price using range1 and range2
    NSMutableDictionary *foodAndPrices = [[NSMutableDictionary alloc] init];
    
    for (NSTextCheckingResult *match in matches)
    {
        NSRange firstRange = [match rangeAtIndex:1];
//        NSRange secondRange = [match rangeAtIndex:2];
        NSRange thirdRange = [match rangeAtIndex:3];
        NSString *objString = [string substringWithRange:thirdRange];
        NSString *keyString = [string substringWithRange:firstRange];
                
        [foodAndPrices setObject:objString forKey:keyString];

    }
    return foodAndPrices;
    
}

@end

