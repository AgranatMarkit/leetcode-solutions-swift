class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var r = indexOfEven(nums, nums.count - 1)
        var arr = nums
        for w in 0..<nums.count {
            guard w < r else { break }
            if arr[w] % 2 != 0 {
                swap(&arr, w, r)
                r = indexOfEven(arr, r)
            }
        }
        return arr
    }
    
    func swap(_ arr: inout [Int], _ w: Int, _ r: Int) {
        let tmp = arr[w]
        arr[w] = arr[r]
        arr[r] = tmp
    }
    
    func indexOfEven(_ arr: [Int], _ r: Int) -> Int {
        for i in stride(from: r, to: -1, by: -1) {
            if arr[i] % 2 == 0 {
                return i
            }
        }
        return -1
    }
}
