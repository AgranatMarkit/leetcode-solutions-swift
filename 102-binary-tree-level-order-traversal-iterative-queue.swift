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
class Queue<T> {
    private class Node<T> {
        var val: T, next: Node?, prev: Node?
        init(val: T, next: Node? = nil, prev: Node? = nil) {
            self.val = val
            self.next = next
            self.prev = prev
        }
    }
    
    private var head: Node<T>?, tail: Node<T>?
    private(set) var count = 0
    var isEmpty: Bool { count == 0 }
    
    init() {}
    
    func enqueue(_ val: T?) {
        guard let val = val else { return }
        if head == nil {
            let node = Node(val: val)
            head = node
            tail = node
        } else {
            head?.prev = Node(val: val, next: head)
            head = head?.prev
        }
        count += 1
    }
    
    func dequeue() -> T {
        guard tail != nil else { fatalError("dequeue on empty queue") }
        let val = tail!.val
        tail = tail?.prev
        if tail == nil { head = nil }
        count -= 1
        return val
    }
}

class Solution {
    // Time O(n)
    // Space O(n)
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var queue = Queue<TreeNode>()
        queue.enqueue(root)
        while !queue.isEmpty {
            var levelSize = queue.count
            var levelVals = [Int]()
            while levelSize != 0 {
                levelSize -= 1
                let node = queue.dequeue()
                queue.enqueue(node.left)
                queue.enqueue(node.right)
                levelVals.append(node.val)
            }
            result.append(levelVals)
        }
        return result
    }
}
