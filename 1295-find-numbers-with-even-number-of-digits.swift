class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        var result = 0
        for x in nums {
            if digitsCount(x) % 2 == 0 { result += 1 }
        }
        return result
    }
    
    func digitsCount(_ number: Int) -> Int {
        var count = 0
        var x = number
        while x != 0 {
            x = Int(x / 10)
            count += 1
        }
        return count
    }
}
