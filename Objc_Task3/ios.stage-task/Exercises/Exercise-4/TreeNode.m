//
//  TreeNode.m
//  ios.stage-task
//
//  Created by Маргарита Жучик on 23.05.21.
//

#import "TreeNode.h"

@implementation TreeNode
-(id)initWithValue:(id)value{
    self = [super init];
    if (self) {
        _value = value;
        _left = nil;
        _right = nil;
        _parent = nil;
        _canHaveLeft = YES;
        _canHaveRight = YES;
    }
    return self;
}
@end
