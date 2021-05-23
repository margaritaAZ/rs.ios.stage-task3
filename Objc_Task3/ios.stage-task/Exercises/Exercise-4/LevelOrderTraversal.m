#import "LevelOrderTraversal.h"
#import "BinaryTree.h"
#import "TreeNode.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    if (tree.count == 0) {
        return @[];
    }
    if (tree.count == 1 ) {
        if([tree.firstObject isEqual:[NSNull null]]) {
            return  @[];
        } else {
            return [NSArray arrayWithObject:tree];
        }
    }
    
    BinaryTree *newTree = [BinaryTree new];
    TreeNode *root = [newTree createBinaryTree:tree];
    NSMutableArray<NSMutableArray*>* levelOrder =  [NSMutableArray new];
    NSArray * resultedArray = [newTree getLevelOrder:root fromLevel:0 toArray:levelOrder];
    return resultedArray;
}
