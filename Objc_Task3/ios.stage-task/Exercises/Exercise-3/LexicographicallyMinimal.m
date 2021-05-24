#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *resultedString = [NSMutableString new];
    while (![string1  isEqual: @""] || ![string2  isEqual: @""]) {
        if ([string1  isEqual: @""]) {
            [resultedString appendString:string2];
            return [resultedString copy];
        }
        if ([string2  isEqual: @""]) {
            [resultedString appendString:string1];
            return [resultedString copy];
        }
        
        NSString *letter1 = [string1 substringToIndex:1];
        NSString *letter2 = [string2 substringToIndex:1];
        NSComparisonResult comparisonResult = [letter1 compare:letter2];
        if (comparisonResult == NSOrderedAscending || comparisonResult == NSOrderedSame) {
            [resultedString appendString:letter1];
            string1 = [string1 substringFromIndex:1];
        } else if (comparisonResult == NSOrderedDescending) {
            [resultedString appendString:letter2];
            string2 = [string2 substringFromIndex:1];
        }
    }
    return [resultedString copy];
}

@end
