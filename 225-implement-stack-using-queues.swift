class MyStack {
    var queue = Queue<Int>()
    var _top = 0

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        _top = x
        queue.enqueue(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        var i = queue.size - 1
        while i != 0 {
            i -= 1
            let element = queue.front
            queue.dequeue()
            queue.enqueue(element)
            if i == 0 {
                _top = element
            }
        }
        let result = queue.front
        queue.dequeue()
        return result
    }
    
    /** Get the top element. */
    func top() -> Int {
        _top
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        queue.isEmpty
    }
}

class Queue<T> {
    private class Node<T> {
        var val: T, next: Node<T>?
        init(_ val: T) {
            self.val = val
        }
    }
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    init() {}
    
    var size = 0
    
    var front: T {
        head!.val
    }
    
    var rear: T {
        tail!.val
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    func enqueue(_ val: T?) {
        guard let val = val else { return }
        let node = Node(val)
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }
        tail = node
        size += 1
    }
    
    func dequeue() {
        if head === tail {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        size = max(0, size - 1)
    }
    
    deinit {
        while !isEmpty {
            dequeue()
        }
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */