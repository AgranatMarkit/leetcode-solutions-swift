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
        typealias Pair = (TreeNode, Int)
        var stack: [Pair] = [(root, root.val)]
        while !stack.isEmpty {
            let (node, sum) = stack.removeLast()
            if node.left == nil && node.right == nil {
                if targetSum == sum { return true }
            }
            node.right.map { stack.append(($0, $0.val + sum)) }
            node.left.map { stack.append(($0, $0.val + sum)) }
        }
        return false
    }
}
