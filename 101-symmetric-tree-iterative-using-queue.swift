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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        original(root?.left) == mirror(root?.right)
    }
    
    func original(_ root: TreeNode?) -> [Int?] {
        var result = [Int?]()
        let queue = Queue<TreeNode?>()
        queue.enqueue(root)
        while !queue.isEmpty {
            let curr = queue.dequeue()
            result.append(curr?.val)
            if curr != nil {
                queue.enqueue(curr?.left)
                queue.enqueue(curr?.right)
            }
        }
        return result
    }
    
    func mirror(_ root: TreeNode?) -> [Int?] {
        var result = [Int?]()
        let queue = Queue<TreeNode?>()
        queue.enqueue(root)
        while !queue.isEmpty {
            let curr = queue.dequeue()
            result.append(curr?.val)
            if curr != nil {
                queue.enqueue(curr?.right)
                queue.enqueue(curr?.left)
            }
        }
        return result
    }
}

final class Queue<T> {
    private final class Node<T> {
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
    
    func enqueue(_ val: T) {
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
