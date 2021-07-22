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
    // Recursive solution
    // Time O(n)
    // Space O(n)
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        guard let newHead = head.next else { return head }
        let next = newHead.next
        newHead.next = head
        head.next = swapPairs(next)
        return newHead
    }
}
