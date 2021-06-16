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
    // Time O(n)
    // Space O(n)
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = Stack<TreeNode>()
        stack.push(root)
        while !stack.isEmpty {
            let curr = stack.pop()
            result.append(curr.val)
            stack.push(curr.left)
            stack.push(curr.right)
        }
        return result.reversed()
    }
}
