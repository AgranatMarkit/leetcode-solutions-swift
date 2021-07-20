class Solution {
    typealias PT = [Int]
    
    // Time O(n^2)
    // space O(n)
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let M = mat.count
        let N = mat[0].count
        var mat = mat
        
        func nears(_ pt: PT) -> [PT] {
            let r = pt[0], c = pt[1]
            let rT = r-1, rB = r+1
            let cL = c-1, cR = c+1
            var result = [PT]()
            if rT >= 0 {
                result.append([rT, c])
            }
            if rB < M {
                result.append([rB, c])
            }
            if cL >= 0 {
                result.append([r, cL])
            }
            if cR < N {
                result.append([r, cR])
            }
            return result
        }
        
        for i in 0..<M {
            for j in 0..<N {
                var visited = Set<PT>()
                let point = [i, j]
                visited.insert(point)
                var queue = Queue<PT>()
                queue.enqueue(point)
                var distance = 0
                while !queue.isEmpty {
                    for _ in 0..<queue.size {
                        let curr = queue.front
                        queue.dequeue()
                        let r = curr[0], c = curr[1]
                        if mat[r][c] == 0 {
                            while !queue.isEmpty {
                                queue.dequeue()
                            }
                            break
                        }
                        
                        for pt in nears(curr) {
                            if visited.contains(pt) {
                                continue
                            }
                            visited.insert(pt)
                            queue.enqueue(pt)
                        }
                    }
                    if !queue.isEmpty {
                        distance += 1
                    }
                }
                mat[i][j] = distance
            }
        }
        return mat
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
