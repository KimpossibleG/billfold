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

+ (id)regexDo:(NSString*)foodString{
    // This is where we'll feed in our string from tesseract:
    NSString *string = @"Hotdog $14.99 Monkey $5.43";
    
    // This allows us to use the error property:
    NSError *error = NULL;
    
    //This gives our pattern to match
    NSRegularExpression *regex = [NSRegularExpression
                        regularExpressionWithPattern:@"(^.+)((\\d+|\\$)(.|\\s)\\d\\d($|\\s))"
                                             options:NSRegularExpressionAnchorsMatchLines
                                               error:&error];
    
    // This gives us an array of our matches
    NSArray *matches = [regex matchesInString:string options:NSRegularExpressionAnchorsMatchLines range:NSMakeRange(0, string.length)];
    
    // Iterate through the matches and create a dictionary of food: price using range1 and range2
    NSMutableDictionary *foodAndPrices = [[NSMutableDictionary alloc] init];
    
    for (NSTextCheckingResult *match in matches)
    {
        NSRange matchRange = match.range;
        NSRange firstHalfRange = [match rangeAtIndex:1];
        NSRange secondHalfRange = [match rangeAtIndex:2];
        NSValue *objVal = [NSValue valueWithRange:secondHalfRange];
        NSValue *keyVal = [NSValue valueWithRange:firstHalfRange];
        [foodAndPrices setObject:objVal forKey:keyVal];

    }
    return foodAndPrices;
    
}

@end

