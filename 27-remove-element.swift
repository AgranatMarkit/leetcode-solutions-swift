class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var j = nums.count - 1
        increaseLeft(&i, nums, val)
        decreaseRight(&j, nums, val)
        while i < nums.count && j < nums.count && i < j {
            swap(&nums, i, j)
            i += 1
            j -= 1
            increaseLeft(&i, nums, val)
            decreaseRight(&j, nums, val)
        }
        return max(0, i)
    }
    
    func increaseLeft(_ i: inout Int, _ nums: [Int], _ val: Int) {
        while i < nums.count && nums[i] != val { i += 1 }
    }
    
    func decreaseRight(_ j: inout Int, _ nums: [Int], _ val: Int) {
        while j > 0 && nums[j] == val { j -= 1 }
    }
    
    func swap(_ nums: inout [Int], _ l: Int, _ r: Int) {
        let tmp = nums[r]
        nums[r] = nums[l]
        nums[l] = tmp
    }
}
