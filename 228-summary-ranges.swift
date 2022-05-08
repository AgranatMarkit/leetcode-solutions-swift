class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var ranges = [String]()
        var index = 0
        while index < nums.count {
            let start = index
            var end = start
            while end + 1 < nums.count && nums[end + 1] == nums[end] + 1 {
                end += 1
            }
            let currentRange = start == end ? "\(nums[start])" : "\(nums[start])->\(nums[end])"
            ranges.append(currentRange)
            index = end + 1
        }
        return ranges
    }
}
