//
//  TesseractController.m
//  BillFold
//
//  Created by Mikee Pourhadi on 7/4/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

#import "TesseractController.h"
#import "tesseract.h"
#import "parsedFood.h"


@implementation TesseractController

static Tesseract *_tesseract = nil;
+ (NSString*)recognizeImage:(UIImage*)image
{
    Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
    _tesseract = tesseract;
    [tesseract setVariableValue:@"$0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,:-()!#/" forKey:@"tessedit_char_whitelist"];

    
    UIImageOrientation originalOrientation = image.imageOrientation;
    CGFloat originalScale = image.scale;
    
    CIImage* prepImage = [[CIImage alloc] initWithImage:image];
    NSDictionary *options = @{kCIImageAutoAdjustRedEye : @false };
    NSArray *adjustments = [prepImage autoAdjustmentFiltersWithOptions:options];
    for (CIFilter *filter in adjustments) {
        [filter setValue:prepImage forKey:kCIInputImageKey];
         prepImage = filter.outputImage;
    }

    CIContext *context = [CIContext contextWithOptions:nil];
    UIImage *newImage = [UIImage imageWithCGImage:[context createCGImage:prepImage fromRect:prepImage.extent] scale:originalScale orientation: originalOrientation];
    [tesseract setImage:newImage];
    NSString *parsedText = [tesseract recognizedText];
    [tesseract clear];
    return parsedText;
}

+ (UIImage*)enhance:(UIImage*)image{
    CIImage* prepImage = [[CIImage alloc] initWithCGImage:image.CGImage];
    NSDictionary *options = @{kCIImageAutoAdjustRedEye : @false };
    NSArray *adjustments = [prepImage autoAdjustmentFiltersWithOptions:options];
    for (CIFilter *filter in adjustments) {
        [filter setValue:prepImage forKey:kCIInputImageKey];
        prepImage = filter.outputImage;
    }
    
    image = [[UIImage alloc] initWithCIImage:prepImage];
    NSLog(@"%f", image.size.height);
    return image;
}



+ (NSMutableArray*)regexDo:(NSString*)foodString{
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

    
    // Iterate through the matches and create an instance of FoodAndPrice

    NSMutableArray *foodPriceCollection = [[NSMutableArray alloc] init];
    
    for (NSTextCheckingResult *match in matches)
    {
        NSRange firstRange = [match rangeAtIndex:1];
//        NSRange secondRange = [match rangeAtIndex:2];
        NSRange thirdRange = [match rangeAtIndex:3];
        NSString *priceString = [string substringWithRange:thirdRange];
        NSString *itemString = [string substringWithRange:firstRange];
        
        ParsedFood *tempFandP = [[ParsedFood alloc] init];
        tempFandP.food = itemString;
        tempFandP.price = priceString;
        tempFandP.counter = 0;
        
        [foodPriceCollection addObject:(tempFandP)];
    }
    return foodPriceCollection;
}

@end

