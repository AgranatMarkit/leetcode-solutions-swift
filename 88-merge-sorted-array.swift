class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var r1 = m-1
        var r2 = n-1
        for i in stride(from: nums1.count-1, to: -1, by: -1) {
            if r2 < 0 {
                break
            }
            if r1 < 0 {
                nums1[i] = nums2[r2]
                r2 -= 1
                continue
            }
            if nums2[r2] > nums1[r1] {
                nums1[i] = nums2[r2]
                r2 -= 1
            } else {
                nums1[i] = nums1[r1]
                r1 -= 1
            }
        }
    }
}
