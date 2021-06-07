class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var freequency = Array(repeating: 0, count: 101)
        for height in heights { freequency[height] += 1 }
        var differences = 0
        var sortedHeight = 0
        for heightIndex in 0..<heights.count {
            while freequency[sortedHeight] == 0 { sortedHeight += 1 }
            if heights[heightIndex] != sortedHeight { differences += 1 }
            freequency[sortedHeight] -= 1
        }
        return differences
    }
}
