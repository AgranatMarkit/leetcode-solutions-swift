class Solution {
    struct Position: Hashable {
        let row: Int, col: Int
        
        func isLand(_ grid: [[Character]]) -> Bool {
            grid[row][col] == "1"
        }
        
        func isWater(_ grid: [[Character]]) -> Bool {
            !isLand(grid)
        }
    }
    
    // Time O(n)
    // Space O(n)
    func numIslands(_ grid: [[Character]]) -> Int {
        var visited = Set<Position>()
        let queue = Queue<Position>()
        var count = 0
        let m = grid.count, n = grid[0].count
        for row in 0..<m {
            for col in 0..<n {
                let position = Position(row: row, col: col)
                guard position.isLand(grid) && !visited.contains(position) else { continue }
                count += 1
                queue.enqueue(position)
                while !queue.isEmpty {
                    let curr = queue.front
                    queue.dequeue()
                    guard !visited.contains(curr) else { continue }
                    visited.insert(curr)
                    let left = Position(row: curr.row, col: max(0, curr.col - 1))
                    let top = Position(row: max(0, curr.row - 1), col: curr.col)
                    let right = Position(row: curr.row, col: min(n - 1, curr.col + 1))
                    let bottom = Position(row: min(m - 1, curr.row + 1), col: curr.col)
                    for pos in [left, top, right, bottom] {
                        if pos.isLand(grid) && !visited.contains(pos) {
                            queue.enqueue(pos)
                        }
                    }
                }
            }
        }
        return count
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
    }
    
    func dequeue() {
        if head === tail {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
    }
}

