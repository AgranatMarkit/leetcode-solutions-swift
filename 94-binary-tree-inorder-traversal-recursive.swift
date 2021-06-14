/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    // Time O(n), where n is a number of the tree nodes
    // Space O(d), where d is a depth of the tree
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        inorderTraversalRecursive(root, &result)
        return result
    }
    
    func inorderTraversalRecursive(_ root: TreeNode?, _ acc: inout [Int]) {
        guard root != nil else { return }
        inorderTraversalRecursive(root?.left, &acc)
        acc.append(root!.val)
        inorderTraversalRecursive(root?.right, &acc)
    }
}
