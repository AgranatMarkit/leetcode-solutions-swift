/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *           self.random = nil
 *     }
 * }
 */

extension Node {
    var copy: Node {
        var x = Node(val)
        x.next = next
        return x
    }
}

class Solution {
    // Time O(n)
    // Space O(n)
    func copyRandomList(_ head: Node?) -> Node? {
        interveawe(head)
        linkRandoms(head)
        return filterCopy(head)
    }
    
    func interveawe(_ head: Node?) {
        var curr = head
        while curr != nil {
            let oldNext = curr?.next
            curr?.next = curr?.copy
            curr?.next?.next = oldNext
            curr = oldNext
        }
    }
    
    func linkRandoms(_ head: Node?) {
        var curr = head
        while curr != nil {
            curr?.next?.random = curr?.random?.next
            curr = curr?.next?.next
        }
    }
    
    func filterCopy(_ head: Node?) -> Node? {
        var result = head?.next
        var curr = head
        while curr != nil {
            let copy = curr?.next
            let next = curr?.next?.next
            copy?.next = next?.next
            curr?.next = next
            curr = next
        }
        return result
    }
}
