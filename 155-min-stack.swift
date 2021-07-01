class MinStack {
    
    private var stack = [Int]()
    private var minimum = Int.max

    /** initialize your data structure here. */
    init() {}
    
    func push(_ val: Int) {
        minimum = min(minimum, val)
        stack.append(val)
    }
    
    func pop() {
        let last = stack.removeLast()
        if last == minimum {
            minimum = Int.max
            for x in stack {
                minimum = min(minimum, x)
            }
        }
    }
    
    func top() -> Int {
        stack.last!
    }
    
    func getMin() -> Int {
        minimum
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
