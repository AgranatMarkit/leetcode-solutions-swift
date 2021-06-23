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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preorder = preorder
        return routine(&preorder, inorder)
    }
    
    func routine(_ preorder: inout [Int], _ inorder: [Int]) -> TreeNode? {
        if inorder.isEmpty { return nil }
        
        let root = TreeNode(preorder.removeFirst())
        var rootIndex = 0
        while inorder[rootIndex] != root.val { rootIndex += 1 }
        
        var left = [Int]()
        for i in 0..<rootIndex { left.append(inorder[i]) }
        root.left = routine(&preorder, left)
        
        var right = [Int]()
        for i in rootIndex+1..<inorder.count { right.append(inorder[i]) }
        root.right = routine(&preorder, right)
        
        return root
    }
}
