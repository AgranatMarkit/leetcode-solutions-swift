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
    // Time O(2^(2*h)), where h is depth of the tree
    // Space O(h), where h is depth of the tree
    func connect(_ root: Node?) -> Node? {
        connect(root: root)
        return root
    }
    
    func connect(root: Node?) {
        guard let root = root else { return }
        var next: Node? = root.right
        var rootPtr: Node? = root
        while next == nil && rootPtr != nil {
            rootPtr = rootPtr?.next
            next = rootPtr?.left ?? rootPtr?.right
        }
        root.left?.next = next
        if next === rootPtr?.left { next = rootPtr?.right }
        while (next === root.right || next == nil) && rootPtr != nil {
            rootPtr = rootPtr?.next
            next = rootPtr?.left ?? rootPtr?.right
        }
        root.right?.next = next
        connect(root: root.right)
        connect(root: root.left)
    }
}
