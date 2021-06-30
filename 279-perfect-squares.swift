class Solution {
    // Time O(n)
    // Space O(n)
    func numSquares(_ n: Int) -> Int {
        var visited = Set<Int>()
        let queue = Queue<Int>()
        queue.enqueue(n)
        var level = 0
        while !queue.isEmpty {
            level += 1
            var levelSize = queue.size
            while levelSize != 0 {
                let curr = queue.front
                queue.dequeue()
                for s in perfectSquares(curr) {
                    let next = curr - s
                    if next == 0 {
                        return level
                    } else if !visited.contains(next) {
                        queue.enqueue(next)
                        visited.insert(next)
                    }
                }
                levelSize -= 1
            }
        }
        return level
    }
    
    // Time O(sqrt(n))
    // Space O(sqrt(n))
    func perfectSquares(_ till: Int) -> [Int] {
        var squares = [Int]()
        for i in 1...100 {
            let square = i * i
            if square > till { break }
            squares.append(square)
        }
        return squares
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
        let old = head
        if head === tail {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        old?.next = nil
        size = max(0, size - 1)
    }
    
    deinit {
        while !isEmpty {
            dequeue()
        }
    }
}
