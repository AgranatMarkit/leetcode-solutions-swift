class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for row in 0..<n/2 {
            for col in row..<(n - 1 - row) {
                let tmp = matrix[row][col]
                matrix[row][col] = matrix[n - 1 - col][row]
                matrix[n - 1 - col][row] = matrix[n - 1 - row][n - 1 - col]
                matrix[n - 1 - row][n - 1 - col] = matrix[col][n - 1 - row]
                matrix[col][n - 1 - row] = tmp
            }
        }
    }
}