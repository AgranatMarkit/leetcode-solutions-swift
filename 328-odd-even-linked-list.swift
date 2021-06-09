/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    // Time: O(n)
    // Space: O(1)
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var oddTail = head
        let evenHead = head?.next
        var odd = oddTail
        var even = evenHead
        while odd != nil || even != nil {
            if odd != nil { oddTail = odd }
            odd?.next = odd?.next?.next
            odd = odd?.next
            even?.next = even?.next?.next
            even = even?.next
        }
        oddTail?.next = evenHead
        return head
    }
}
