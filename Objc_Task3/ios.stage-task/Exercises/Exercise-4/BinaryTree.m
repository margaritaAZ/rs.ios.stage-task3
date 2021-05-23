//
//  BinaryTree.m
//  ios.stage-task
//
//  Created by Маргарита Жучик on 23.05.21.
//

#import "BinaryTree.h"

@implementation BinaryTree
-(TreeNode *)insertNode:(TreeNode *)parent withData:(id)value {
    if (![value isEqual:[NSNull null]]) {
        TreeNode *newNode = [[TreeNode alloc] initWithValue:value];
        if (parent.canHaveLeft) {
            newNode.parent = parent;
            parent.left = newNode;
            parent.canHaveLeft = NO;
            return newNode;
        }
        if (parent.canHaveRight) {
            newNode.parent = parent;
            parent.right = newNode;
            parent.canHaveRight = NO;
            return newNode;
        
    }
    } else {
        if (parent.canHaveLeft) {
            parent.canHaveLeft = NO;
            return parent;
        } else {
            parent.canHaveRight = NO;
            return parent.parent;
        }
    }
    return nil;
}

-(TreeNode *)createBinaryTree:(NSArray *)tree {
    TreeNode *root = [[TreeNode alloc] initWithValue:tree.firstObject];
    TreeNode *nextNode = root;
    for (int i = 1; i < tree.count; i++) {
        if (nextNode.canHaveLeft || nextNode.canHaveRight) {
            nextNode  = [self insertNode:nextNode withData:tree[i]];
        } else {
            while (!(nextNode.canHaveRight)) {
                nextNode = nextNode.parent;
            }
            nextNode = [self insertNode:nextNode withData:tree[i]];
        }
    }
    return root;
}

-(NSArray *)getLevelOrder:(TreeNode *)root fromLevel: (NSInteger)level toArray: (NSMutableArray<NSMutableArray*>*)array{
    
    if (root == nil) {
        level = 0;
        return [array copy];
    }
    NSMutableArray *tmpArray = [[NSMutableArray alloc] initWithObjects:root.value, nil];
    if (array.count == level) {
        [array addObject:tmpArray];
    } else if (array.count > level) {
        [array[level] addObject:root.value];
    }

//    NSLog(@"value:%@ , level:%ld", root.value, (long)level);
    level += 1;
    [self getLevelOrder:root.left fromLevel:level toArray:array];
    [self getLevelOrder:root.right fromLevel:level toArray:array];
    
    return [array copy];
}
@end
