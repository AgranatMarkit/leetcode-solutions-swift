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
    // Time O(n + m), where n is l1 size and m is l2 size
    // Space O(1)
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head: ListNode? = nil, curr: ListNode? = nil
        var p1 = l1, p2 = l2
        while p1 != nil || p2 != nil {
            if head == nil {
                head = smaller(p1, p2)
                increaseSmaller(head, &p1, &p2)
                curr = head
            } else {
                let newCurr = smaller(p1, p2)
                increaseSmaller(newCurr, &p1, &p2)
                curr?.next = newCurr
                curr = newCurr
            }
        }
        return head
    }
    
    func smaller(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let v1 = l1?.val else { return l2 }
        guard let v2 = l2?.val else { return l1 }
        return v1 < v2 ? l1 : l2
    }
    
    func increaseSmaller(_ smaller: ListNode?, _ l1: inout ListNode?, _ l2: inout ListNode?) {
        if l1 === smaller { l1 = l1?.next }
        if l2 === smaller { l2 = l2?.next }
    }
}
