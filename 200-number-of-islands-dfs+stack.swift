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
        var stack = [Position]()
        var count = 0
        let m = grid.count, n = grid[0].count
        
        func DFS(_ position: Position) {
            guard !visited.contains(position) else { return }
            visited.insert(position)
            let left = Position(row: position.row, col: max(0, position.col - 1))
            let top = Position(row: max(0, position.row - 1), col: position.col)
            let right = Position(row: position.row, col: min(n - 1, position.col + 1))
            let bottom = Position(row: min(m - 1, position.row + 1), col: position.col)
            for p in [left, top, right, bottom] {
                if p.isLand(grid) && !visited.contains(p) {
                    stack.append(p)
                }
            }
        }
        
        for row in 0..<m {
            for col in 0..<n {
                let position = Position(row: row, col: col)
                guard position.isLand(grid) && !visited.contains(position) else { continue }
                count += 1
                stack.append(position)
                while !stack.isEmpty {
                    DFS(stack.removeLast())
                }
            }
        }
        return count
    }
}

