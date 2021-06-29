class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        openLock(deadends.compactMap(Int.init), Int(target)!)
    }
    
    func openLock(_ deadends: [Int], _ target: Int) -> Int {
        if deadends.contains(0) { return -1 }
        
        var visited = Set<Int>()
        deadends.forEach { visited.insert($0) }
        let queue = Queue<Int>()
        queue.enqueue(target)
        var moves = 0
        while !queue.isEmpty {
            var size = queue.size
            while size != 0 {
                let front = queue.front
                queue.dequeue()
                size -= 1
                if visited.contains(front) { continue }
                visited.insert(front)
                if front == 0 { return moves }
                for nextState in nextStates(front) {
                    guard !visited.contains(nextState) else { continue }
                    queue.enqueue(nextState)
                }
            }
            moves += 1
        }
        return -1
    }
    
    func nextStates(_ original: Int) -> [Int] {
        var nextStates = [Int]()
        for i in 0...3 {
            var rank = 1
            for _ in 0..<i { rank *= 10 }
            let digit = original / rank % 10
            let prevDigit = (digit + 9) % 10
            let nextDigit = (digit + 1) % 10
            let originalWithoutRank = original - digit * rank
            let prevState = originalWithoutRank + prevDigit * rank
            nextStates.append(prevState)
            let nextState = originalWithoutRank + nextDigit * rank
            nextStates.append(nextState)
        }
        return nextStates
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
}
