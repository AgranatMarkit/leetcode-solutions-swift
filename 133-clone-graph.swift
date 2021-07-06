/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    // Time O(n)
    // Space O(n)
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        var copies: [Node?] = Array(repeating: nil, count: 101)
        var stack = [node]
        var head: Node = makeCopy(node.val, &copies)
        while !stack.isEmpty {
            let top = stack.removeLast()
            let copy = makeCopy(top.val, &copies)
            guard copy.neighbors.count != top.neighbors.count else { continue }
            for neighbor in top.neighbors {
                guard let neighbor = neighbor else {
                    copy.neighbors.append(nil)
                    continue
                }
                let neighborCopy = makeCopy(neighbor.val, &copies)
                copy.neighbors.append(neighborCopy)
                stack.append(neighbor)
            }
        }
        return head
    }
    
    func makeCopy(_ val: Int, _ copies: inout [Node?]) -> Node {
        if copies[val] == nil {
            copies[val] = Node(val)
        }
        return copies[val]!
    }
}
