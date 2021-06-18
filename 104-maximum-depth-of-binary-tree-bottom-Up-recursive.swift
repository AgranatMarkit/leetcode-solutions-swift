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
    // Time O(n), n - number of tree nodes.
    // Space O(h), h - height of tallest tree branch.
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
}
