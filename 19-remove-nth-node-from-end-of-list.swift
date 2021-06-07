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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var prev: ListNode? = nil
        var begin = head
        var end = head
        var size = 0
        
        while end != nil {
            if size >= n {
                prev = begin
                begin = begin?.next
            }
            end = end?.next
            size += 1
        }
        
        if let prev = prev {
            prev.next = prev.next?.next
            return head
        } else {
            return head?.next
        }
    }
}