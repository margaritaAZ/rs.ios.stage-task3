//
//  BinaryTree.h
//  ios.stage-task
//
//  Created by Маргарита Жучик on 23.05.21.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTree : NSObject
- (TreeNode *) createBinaryTree: (NSArray *)tree;
- (NSArray *) getLevelOrder :(TreeNode *) root fromLevel: (NSInteger)level toArray: (NSMutableArray<NSMutableArray*>*)array;
@end

NS_ASSUME_NONNULL_END
