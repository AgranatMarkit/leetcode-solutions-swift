class Solution {
    // Time O(n)
    // Space O(1)
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = Int.min
        var currSum = maxSum
        for num in nums {
            currSum = max(currSum, 0) + num
            maxSum = max(maxSum, currSum)
        }
        return maxSum
    }
}
