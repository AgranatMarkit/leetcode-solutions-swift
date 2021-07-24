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
    // Space O(n)
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root?.val == val || root == nil { return root }
        let left = searchBST(root?.left, val)
        if left != nil { return left }
        return searchBST(root?.right, val)
    }
}
