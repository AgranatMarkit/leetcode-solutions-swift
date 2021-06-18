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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return original(root?.left) == mirror(root?.right)
    }
    
    func original(_ root: TreeNode?) -> [Int?] {
        guard root != nil else { return [nil] }
        return [root!.val] + original(root?.left) + original(root?.right)
    }
    
    func mirror(_ root: TreeNode?) -> [Int?] {
        guard root != nil else { return [nil] }
        return [root!.val] + mirror(root?.right) + mirror(root?.left)
    }
}
