final class Node {
    let val: Int
    var next: Node?
    init(val: Int, next: Node? = nil) {
        self.val = val
        self.next = next
    }
}


class MyLinkedList {
    
    var head: Node? = nil
    var count = 0
    var isEmpty: Bool { count == 0 }

    /** Initialize your data structure here. */
    init() {}
    
    private func getNode(_ index: Int) -> Node? {
        var curr = head
        for _ in 0..<index { curr = curr?.next }
        return curr
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        getNode(index)?.val ?? -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        var node = Node(val: val, next: head)
        head = node
        count += 1
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        if isEmpty { addAtHead(val); return }
        getNode(count - 1)?.next = Node(val: val)
        count += 1
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > count { return }
        else if index == count { addAtTail(val) }
        else if isEmpty || index == 0 { addAtHead(val) }
        else {
            var prev = getNode(index - 1)
            var curr = Node(val: val, next: prev?.next)
            prev?.next = curr
            count += 1
        }
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if isEmpty || index > count - 1 { return }
        if index == 0 {
            let next = head?.next
            head?.next = nil
            head = next
        } else {
            let prev = getNode(index - 1)
            let curr = prev?.next
            prev?.next = curr?.next
            curr?.next = nil
        }
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
