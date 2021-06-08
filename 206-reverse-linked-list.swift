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
    // Iterative version
    // Time O(n)
    // Space O(n)
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
    
    // Recursive version
    // Time O(n)
    // Space O(n)
    func reverseList(prev: ListNode?, curr: ListNode?) -> ListNode? {
        if curr == nil { return prev }
        let next = curr?.next
        curr?.next = prev
        return reverseList(prev: curr, curr: next)
    }
}
