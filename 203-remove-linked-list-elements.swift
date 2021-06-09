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
    // Time O(n)
    // Space O(1)
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        while head != nil && head!.val == val {
            head = head!.next
        }
        
        var prev = nil as ListNode?
        var curr = head
        while curr != nil {
            if curr!.val == val {
                prev?.next = curr?.next
            } else {
                prev = curr
            }
            curr = curr?.next
        }
        
        return head
    }
}
