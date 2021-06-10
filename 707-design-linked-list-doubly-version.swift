final class LinkedNode {
    let val: Int
    var prev: LinkedNode?
    var next: LinkedNode?
    init(val: Int, prev: LinkedNode? = nil, next: LinkedNode? = nil) {
        self.val = val
        self.prev = prev
        self.next = next
    }
    
    func moveForward(_ times: Int) -> LinkedNode? {
        var times = times, curr: LinkedNode? = self
        while times != 0 { times -= 1; curr = curr?.next }
        return curr
    }
}

final class MyLinkedList {
    var head: LinkedNode?
    var tail: LinkedNode?
    var count = 0
    var isEmpty: Bool { count == 0 }

    /** Initialize your data structure here. */
    init() {}
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        head?.moveForward(index)?.val ?? -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        head = LinkedNode(val: val, next: head)
        head?.next?.prev = head
        if tail == nil { tail = head }
        count += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        tail = LinkedNode(val: val, prev: tail)
        tail?.prev?.next = tail
        if head == nil { head = tail }
        count += 1
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > count { return }
        if index == 0 { addAtHead(val); return }
        if index == count { addAtTail(val); return }
        let curr = head?.moveForward(index)
        let node = LinkedNode(val: val, prev: curr?.prev, next: curr)
        node.prev?.next = node
        node.next?.prev = node
        count += 1
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        guard index < count else { return }
        let curr = head?.moveForward(index)
        curr?.next?.prev = curr?.prev
        curr?.prev?.next = curr?.next
        if index == 0 { head = curr?.next }
        if index == count-1 { tail = curr?.prev }
        curr?.next = nil
        curr?.prev = nil
        count -= 1
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
