#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger arrayCount = ratingArray.count;
    NSInteger teamsCount = 0;
    for (int i = 0; i < arrayCount - 2; i++) {
        for (int j = i + 1; j < arrayCount; j++) {
            if (ratingArray[i].intValue < ratingArray[j].intValue) {
                for (int k = j + 1; k < arrayCount; k++) {
                    if (ratingArray[j].intValue < ratingArray[k].intValue) {
                        teamsCount ++;
                    } else if (ratingArray[j].intValue == ratingArray[k].intValue) {
                        return 0;
                    }
                }
            } else if (ratingArray[i].intValue > ratingArray[j].intValue) {
                for (int k = j + 1; k < arrayCount; k++) {
                    if (ratingArray[j].intValue > ratingArray[k].intValue) {
                        teamsCount ++;
                    } else if (ratingArray[j].intValue == ratingArray[k].intValue) {
                        return 0;
                    }
                }
            } else {
                return 0;
            }
        }
    }
    NSLog(@"%ld", (long)teamsCount);
    return teamsCount;
}

@end
