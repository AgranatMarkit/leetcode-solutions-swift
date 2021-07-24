class Solution {
    // Time O((k^2)/ 2), where k is number of element in row at rowIndex
    // Space O(rowIndex)
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return [1]
        }
        let prev = getRow(rowIndex - 1)
        var row = [Int]()
        for i in 0...rowIndex {
            if i == 0 || i == rowIndex {
                row.append(1)
            } else {
                row.append(prev[i-1] + prev[i])
            }
        }
        return row
    }
}
