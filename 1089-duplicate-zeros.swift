class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var cpy = arr
        var i = 0
        var j = 0
        while i < cpy.count {
            if arr[j] != 0 {
                cpy[i] = arr[j]
            } else {
                cpy[i] = 0
                i += 1
                if i < cpy.count { cpy[i] = 0 }
            }
            i += 1
            j += 1
        }
        arr = cpy
    }
}
