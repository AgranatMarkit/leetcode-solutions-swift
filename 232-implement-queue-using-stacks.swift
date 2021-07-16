class MyQueue {
    let front = Stack<Int>()
    let back = Stack<Int>()
    
    /** Initialize your data structure here. */
    init() {}
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        back.push(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        fillFront()
        return front.pop()!
    }
    
    /** Get the front element. */
    func peek() -> Int {
        fillFront()
        return front.top!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        front.isEmpty && back.isEmpty
    }
    
    func fillFront() {
        if front.isEmpty {
            while !back.isEmpty {
                front.push(back.pop()!)
            }
        }
    }
}

class Stack<T> {
    private var topNode: Node<T>?
    
    var isEmpty: Bool {
        topNode == nil
    }
    
    var top: T? {
        topNode?.value
    }
    
    private(set) var size = 0
    
    func push(_ value: T) {
        let node = Node(value, topNode)
        topNode = node
        size += 1
    }
    
    @discardableResult
    func pop() -> T? {
        size = max(0, size - 1)
        let value = topNode?.value
        topNode = topNode?.next
        return value
    }
    
    deinit {
        while !isEmpty {
            pop()
        }
    }
    
    private class Node<T> {
        let value: T
        var next: Node?
        init(_ value: T, _ next: Node?) {
            self.value = value
            self.next = next
        }
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
