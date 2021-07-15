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
        guard var root = root else { return [] }
        var result = [Int]()
        var nodes = Stack<TreeNode>()
        var visits = Stack<Bool>()
        nodes.push(root)
        visits.push(false)
        while !nodes.isEmpty {
            let node = nodes.top
            let visited = visits.top
            if visited || node.left == nil {
                nodes.pop()
                visits.pop()
                result.append(node.val)
                node.right.map {
                    nodes.push($0)
                    visits.push(false)
                }
            } else {
                visits.pop()
                visits.push(true)
                nodes.push(node.left!)
                visits.push(false)
            }
        }
        return result
    }
}

class Stack<T> {
    private var arr = [T]()
    
    var isEmpty: Bool { arr.isEmpty }
    var count: Int { arr.count }
    var top: T { arr.last! }
    
    func push(_ val: T) {
        arr.append(val)
    }
    
    func pop() {
        arr.removeLast()
    }
}
