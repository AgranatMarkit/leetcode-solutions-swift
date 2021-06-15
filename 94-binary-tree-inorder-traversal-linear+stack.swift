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
final class Stack<T> {
    private var storage = [T]()
    
    var isEmpty: Bool { storage.isEmpty }
    
    func push(_ value: T) {
        storage.append(value)
    }
    
    func push(_ value: T?) {
        if let value = value { push(value) }
    }
    
    func pop() -> T {
        storage.removeLast()
    }
}

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack = Stack<TreeNode>()
        stack.push(root)
        var result = [Int]()
        while !stack.isEmpty {
            let curr = stack.pop()
            if curr.left == nil {
                result.append(curr.val)
                if !stack.isEmpty {
                    let parent = stack.pop()
                    parent.left = nil
                    stack.push(curr.right)
                    stack.push(parent)
                } else {
                    stack.push(curr.right)
                }
            } else {
                stack.push(curr)
                stack.push(curr.left)
            }
        }
        return result
    }
}
