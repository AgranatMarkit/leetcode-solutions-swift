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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var curr = root
        while curr != nil {
            if curr?.left != nil {
                let left = curr?.left
                var right = left
                while right?.right != nil {
                    right = right?.right
                }
                right?.right = curr
                curr?.left = nil
                curr = left
            } else {
                result.append(curr!.val)
                curr = curr?.right
            }
        }
        return result
    }
}
