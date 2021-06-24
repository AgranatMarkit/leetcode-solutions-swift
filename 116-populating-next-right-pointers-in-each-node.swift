/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *       public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    // Time O(n)
    // Space O(h), where h is a height of the tree
    func connect(_ root: Node?) -> Node? {
        connect(root?.left, root?.right)
        return root
    }
    
    func connect(_ first: Node?, _ second: Node?) {
        guard let first = first, let second = second else { return }
        first.next = second
        connect(first.left, first.right)
        connect(first.right, second.left)
        connect(second.left, second.right)
    }
}
