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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var postorderCopy = postorder
        return routine(inorder, &postorderCopy)
    }
    
    func routine(_ inorder: [Int], _ postorder: inout [Int]) -> TreeNode? {
        guard !inorder.isEmpty else { return nil }
        
        let root = TreeNode(postorder.last!)
        var rootIndex = 0
        while inorder[rootIndex] != postorder.last! { rootIndex += 1 }
        postorder.removeLast()
        
        var right = [Int]()
        for i in rootIndex+1..<inorder.count { right.append(inorder[i]) }
        root.right = routine(right, &postorder)

        var left = [Int]()
        for i in 0..<rootIndex { left.append(inorder[i]) }
        root.left = routine(left, &postorder)
        
        return root
    }
}
