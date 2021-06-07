class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var result = 0
        var current = 0
        for x in nums {
            if x == 0 {
                result = max(result, current)
                current = 0
            } else {
                current += 1
            }
        }
        return max(result, current)
    }
}
