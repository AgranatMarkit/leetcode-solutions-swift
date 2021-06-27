class MyCircularQueue {
    var head = 0
    var tail = 0
    var k: Int { arr.count }
    var arr: [Int]

    // Time O(n)
    // Space O(n)
    init(_ k: Int) {
        arr = Array(repeating: -1, count: k)
    }
    
    // Time O(1)
    // Space O(1)
    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        if !isEmpty() {
            tail = (tail + 1) % k
        }
        arr[tail] = value
        return true
    }
    
    // Time O(1)
    // Space O(1)
    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        arr[head] = -1
        if head != tail {
            head = (head + 1) % k
        }
        return true
    }
    
    // Time O(1)
    // Space O(1)
    func Front() -> Int {
        arr[head]
    }
    
    // Time O(1)
    // Space O(1)
    func Rear() -> Int {
        arr[tail]
    }

    // Time O(1)
    // Space O(1)
    func isEmpty() -> Bool {
        head == tail && Front() == -1
    }
    
    // Time O(1)
    // Space O(1)
    func isFull() -> Bool {
        let nextToTail = (tail + 1) % k
        return nextToTail == head && Front() != -1
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */
