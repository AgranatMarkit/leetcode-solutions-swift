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
    // Time O(n)
    // Space O(h), h is a height of the tallest branch
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        let isLeaf = root.left == nil && root.right == nil
        if isLeaf && root.val == targetSum { return true }
        let sumWithoutCurr = targetSum - root.val
        return hasPathSum(root.left, sumWithoutCurr) || hasPathSum(root.right, sumWithoutCurr)
    }
}
