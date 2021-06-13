/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    // Time O(n)
    // Space O(1)
    func flatten(_ head: Node?) -> Node? {
        var curr = head
        while curr != nil {
            _flatten(curr)
            curr = curr?.next
        }
        return head
    }
    
    func _flatten(_ begin: Node?) {
        guard let begin = begin,
              var curr = begin.child else { return }
        while curr.next != nil { curr = curr.next! }
        curr.next = begin.next
        begin.next?.prev = curr
        begin.next = begin.child
        begin.child?.prev = begin
        begin.child = nil
    }
}
