class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        guard arr.count > 1 else  { return [-1] }
        var a = arr
        var max = -1
        for i in stride(from: a.count - 1, to: -1, by: -1) {
            let curr = a[i]
            a[i] = max
            if curr > max { max = curr }
        }
        return a
    }
}
