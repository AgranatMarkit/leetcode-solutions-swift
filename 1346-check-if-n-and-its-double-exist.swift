class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var mem = [Int: Int]()
        for x in arr { mem[x] = (mem[x] ?? 0) + 1 }
        for x in arr {
            let tc = x == 0 ? 1 : 0
            if x%2 == 0 && (mem[x/2] ?? 0) > tc { return true }
        }
        return false
    }
}
