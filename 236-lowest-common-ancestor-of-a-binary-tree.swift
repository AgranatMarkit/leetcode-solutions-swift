/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    // Time O(n)
    // Space O(h), where h is height of the binary tree
    typealias Node = TreeNode
    func lowestCommonAncestor(_ root: Node?, _ p: Node?, _ q: Node?) -> Node? {
        guard let root = root else { return nil }
        let path1 = path(root, p!), path2 = path(root, q!)
        var lca = path1.last!
        var ptr1 = path1.count - 1, ptr2 = path2.count - 1
        while ptr1 >= 0 && ptr2 >= 0 && path1[ptr1] === path2[ptr2] {
            lca = path1[ptr1]
            ptr1 -= 1
            ptr2 -= 1
        }
        return lca
    }
    
    func path(_ root: Node?, _ node: Node) -> [Node] {
        guard let root = root else { return [] }
        let leftPath = path(root.left, node)
        if !leftPath.isEmpty { return leftPath + [root] }
        let rightPath = path(root.right, node)
        if !rightPath.isEmpty { return rightPath + [root] }
        return root === node ? [root] : []
    }
}
