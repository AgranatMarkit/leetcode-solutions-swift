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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        postorderTraversalRecursive(root, &result)
        return result
    }
    
    func postorderTraversalRecursive(_ root: TreeNode?, _ accumulator: inout [Int]) {
        guard root != nil else { return }
        postorderTraversalRecursive(root?.left, &accumulator)
        postorderTraversalRecursive(root?.right, &accumulator)
        accumulator.append(root!.val)
    }
}
