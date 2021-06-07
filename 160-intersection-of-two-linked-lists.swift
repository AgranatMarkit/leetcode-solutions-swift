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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var pa = headA, pb = headB
        var lenA = 0, lenB = 0
        while pa != nil || pb != nil {
            if pa != nil {
                pa = pa!.next
                lenA += 1
            }
            if pb != nil {
                pb = pb!.next
                lenB += 1
            }
        }
        
        guard pa === pb else { return nil }
        
        pa = headA
        pb = headB
        while lenA != lenB {
            if lenA > lenB {
                pa = pa?.next
                lenA -= 1
            } else {
                pb = pb?.next
                lenB -= 1
            }
        }
        
        while pa !== pb {
            pa = pa?.next
            pb = pb?.next
        }
        
        return pa
    }
}
