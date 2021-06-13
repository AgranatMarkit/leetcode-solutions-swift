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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var last: ListNode? = nil
        let sz = size(head, &last)
        guard sz > 0 else { return head }
        var k = sz - (k % sz)
        last?.next = head
        var newTail = last, newHead = head
        while k > 0 {
            k -= 1
            newTail = newHead
            newHead = newHead?.next
        }
        newTail?.next = nil
        return newHead
    }
    
    func size(_ head: ListNode?, _ last: inout ListNode?) -> Int {
        var size = 0, curr: ListNode? = head
        while curr != nil {
            size += 1
            if curr?.next == nil { last = curr }
            curr = curr?.next
        }
        return size
    }
}
