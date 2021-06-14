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

typealias TreeStack = Stack<TreeNode>

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        /* Recursive part
        var result = [Int]()
        preorderTraversalRecursive(root, &result)
        return result
        */
        preorderTraversalIterative(root)
    }
    
    // Time O(n)
    // Space O(d), where d is the depth of the tree
    func preorderTraversalRecursive(_ root: TreeNode?, _ arr: inout [Int]) {
        guard let val = root?.val else { return }
        arr.append(val)
        preorderTraversalRecursive(root?.left, &arr)
        preorderTraversalRecursive(root?.right, &arr)
    }
    
    // Time O(n)
    // Space O(d), where d is the depth of the tree
    func preorderTraversalIterative(_ root: TreeNode?) -> [Int] {
        var stack = TreeStack(), result = [Int]()
        stack.push(root)
        while !stack.isEmpty {
            let curr = stack.pop()
            result.append(curr.val)
            stack.push(curr.right)
            stack.push(curr.left)
        }
        return result
    }
}
