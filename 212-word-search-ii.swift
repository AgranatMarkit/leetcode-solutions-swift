class TrieNode {
    var children = [Character: TrieNode]()
    var isWord = false
    var refs = 0
    
    func append(_ word: String) {
        var curr: TrieNode = self
        curr.refs += 1
        for c in word {
            curr.children[c] = curr.children[c] ?? TrieNode()
            curr = curr.children[c]!
            curr.refs += 1
        }
        curr.isWord = true
    }
    
    func remove(_ word: String) {
        var curr = self
        for c in word {
            guard let child = curr.children[c] else { continue }
            child.refs -= 1
            curr = child
        }
    }
}

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        var result = [String]()
        var visited = Set<[Int]>()
        let rows = board.count
        let cols = board[0].count
        
        func dfs(_ r: Int, _ c: Int, _ node: TrieNode, _ word: String) {
            if r == -1 || r == rows ||
               c == -1 || c == cols ||
               visited.contains([r, c]) { return }
            guard let nextNode = node.children[board[r][c]], nextNode.refs > 0 else { return }
            let word = word + "\(board[r][c])"
            if nextNode.isWord {
                nextNode.isWord = false
                result.append(word)
                trie.remove(word)
            }
            visited.insert([r, c])
            dfs(r - 1, c, nextNode, word)
            dfs(r + 1, c, nextNode, word)
            dfs(r, c - 1, nextNode, word)
            dfs(r, c + 1, nextNode, word)
            visited.remove([r, c])
        }
        
        let trie = TrieNode()
        for word in words {
            trie.append(word)
        }
        
        for r in 0..<rows {
            for c in 0..<cols {
                dfs(r, c, trie, "")
            }
        }
        
        return result
    }
}