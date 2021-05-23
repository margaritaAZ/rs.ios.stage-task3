//
//  TreeNode.h
//  ios.stage-task
//
//  Created by Маргарита Жучик on 23.05.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject
@property (nonatomic, strong) id value;
@property (nonatomic, strong) TreeNode *parent;
@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) TreeNode *right;
@property (nonatomic, assign) BOOL canHaveLeft;
@property (nonatomic, assign) BOOL canHaveRight;

- (id) initWithValue: (id) value;
@end

NS_ASSUME_NONNULL_END
