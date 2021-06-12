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
    // Time O(n), where n is max(l1.count, l2.count)
    // Space O(1)
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carryBit = false, p1 = l1, p2 = l2
        while p1 != nil || p2 != nil {
            p1?.val = sum(p1, p2, &carryBit)
            // Save memory by changing l1 without creating third linked list
            if p1?.next == nil && p2?.next != nil {
                p1?.next = p2?.next
                p2 = nil
            } else if p1?.next == nil && carryBit {
                p1?.next = ListNode(0)
            }
            p1 = p1?.next
            p2 = p2?.next
        }
        return l1
    }
    
    func sum(_ l1: ListNode?, _ l2: ListNode?, _ carryBit: inout Bool) -> Int {
        let v1 = l1?.val ?? 0
        let v2 = l2?.val ?? 0
        let c = carryBit ? 1 : 0
        let sum = v1 + v2 + c
        carryBit = sum > 9 ? true : false
        return sum % 10
    }
}
