class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let rows = board.count
        let cols = board[0].count
        var sets = Array(repeating: 0, count: 27)
        for row in 0..<rows {
            for col in 0..<cols {
                guard let digit = board[row][col].wholeNumberValue else { continue }
                let mask = 1 << digit
                guard sets[row] & mask == 0 else { return false }
                sets[row] |= mask
                let colIdx = col + 9
                guard sets[colIdx] & mask == 0 else { return false }
                sets[colIdx] |= mask
                let boxIdx = (row / 3 * 3 + col / 3) + 18
                guard sets[boxIdx] & mask == 0 else { return false }
                sets[boxIdx] |= mask
            }
        }
        return true
    }
}