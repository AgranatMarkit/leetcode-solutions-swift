class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        guard arr.count > 2 else { return false }
        // 0 - start, 1 - increasing, 2 - decreasing
        var state = 0
        for i in 1..<arr.count {
            let prev = arr[i-1]
            let curr = arr[i]
            if prev == curr { return false }
            if state == 0 && curr < prev { return false }
            if state == 0 { state = 1 }
            if state == 1 && curr < prev { state = 2 }
            if state == 2 && curr > prev { return false }
        }
        return state == 2
    }
}
