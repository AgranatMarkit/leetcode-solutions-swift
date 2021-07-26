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
    // // Recursive straightforward solution
    // // Time O(n), n - number of tree nodes.
    // // Space O(h), h - height of tallest tree branch.
    // func maxDepth(_ root: TreeNode?) -> Int {
    //     guard root != nil else { return 0 }
    //     return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    // }
    
    // Recursive tail recursion solution
    // Time O(n)
    // Space O(n)
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var pending = [root]
        var depth = [ObjectIdentifier(root): 0]
        return helper(&pending, &depth)
    }
    
    func helper(_ pending: inout [TreeNode], _ depth: inout [ObjectIdentifier: Int]) -> Int {
        guard pending.count > 0 else {
            var result = 0
            for value in depth.values {
                result = max(result, value)
            }
            return result
        }
        let last = pending.removeLast()
        let lastId = ObjectIdentifier(last)
        depth[lastId] = 1 + depth[lastId]!
        if let left = last.left {
            pending.append(left)
            depth[ObjectIdentifier(left)] = depth[lastId]
        }
        if let right = last.right {
            pending.append(right)
            depth[ObjectIdentifier(right)] = depth[lastId]
        }
        return helper(&pending, &depth)
    }
}
