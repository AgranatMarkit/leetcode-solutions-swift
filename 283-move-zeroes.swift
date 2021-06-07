class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        var zeros = 0
        for x in nums {
            if x == 0 { zeros += 1 }
        }
        
        var writePointer = 0
        while writePointer < nums.count && nums[writePointer] != 0 {
            writePointer += 1
        }
        var readPointer = writePointer + 1
        while readPointer < nums.count {
            if nums[readPointer] != 0 {
                nums[writePointer] = nums[readPointer]
                writePointer += 1
            }
            readPointer += 1
        }
        
        for i in stride(from: nums.count - 1, to: nums.count - zeros - 1, by: -1) {
            nums[i] = 0
        }
    }
}
