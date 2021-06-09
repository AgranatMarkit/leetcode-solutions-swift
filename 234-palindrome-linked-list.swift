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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var len = calculateLen(of: head)
        let isOdd = len % 2 == 0
        len = Int(len/2)
        
        var p1 = head, p2 = reverseList(move(head, len + (isOdd ? 0 : 1)))
        while len > 0 {
            len -= 1
            if p1?.val != p2?.val { return false }
            p1 = p1?.next
            p2 = p2?.next
        }
        
        return true
    }
    
    func calculateLen(of head: ListNode?) -> Int {
        var len = 0, curr = head
        while curr != nil {
            len += 1
            curr = curr?.next
        }
        return len
    }
    
    func move(_ head: ListNode?, _ times: Int) -> ListNode? {
        var times = times, curr = head
        while times > 0 {
            times -= 1
            curr = curr?.next
        }
        return curr
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil, curr = head
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
}
