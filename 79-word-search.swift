class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let m = board.count
        let n = board[0].count
        guard word.count <= m * n else { return false }
        
        var path = Set<[Int]>()
        let word = Array(word)
        
        func dfs(_ c: Int, _ i: Int, _ j: Int) -> Bool {
            if c >= word.count { return true }
            if i <= -1 || i >= m ||
               j <= -1 || j >= n ||
               (board[i][j] != word[c]) ||
               path.contains([i, j]) { return false }

            path.insert([i, j])

            let result = dfs(c + 1, i - 1, j) ||
               dfs(c + 1, i + 1, j) ||
               dfs(c + 1, i, j - 1) ||
               dfs(c + 1, i, j + 1)

            path.remove([i, j])

            return result
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if dfs(0, i, j) {
                    return true
                }
            }
        }
        return false
    }
}