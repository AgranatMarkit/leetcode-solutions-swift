class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var zeroFinded = false
        var ones = 0
        var pointer = 0
        var leftOnes = 0
        while pointer < nums.count && nums[pointer] == 1 { // count left side ones
            leftOnes += 1
            pointer += 1
        }
        while pointer < nums.count {
            zeroFinded = true
            pointer += 1 // skip zero
            var rightOnes = 0
            while pointer < nums.count && nums[pointer] == 1 { // count right side ones
                rightOnes += 1
                pointer += 1
            }
            ones = max(ones, leftOnes + rightOnes)
            leftOnes = rightOnes
        }
        return zeroFinded ? ones : max(0, nums.count - 1)
    }
}
