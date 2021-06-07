/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var i = 0
        var curr = head
        while curr?.next != nil {
            curr = curr?.next
            i += 1
            if i > 10000 { return true }
        }
        return false
    }
}
