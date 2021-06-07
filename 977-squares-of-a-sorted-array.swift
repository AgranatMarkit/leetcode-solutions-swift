class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        let table = createFreequencyTable(nums)
        for i in table.indices {
            var freequency = table[i]
            for _ in 0..<freequency {
                result.append(i*i)
            }
        }
        return result
    }
    
    func createFreequencyTable(_ nums: [Int]) -> [Int] {
        var table = Array(repeating: 0, count: 10001)
        for x in nums {
            table[abs(x)] += 1
        }
        return table
    }
}
