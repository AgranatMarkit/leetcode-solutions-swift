class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        let xor = nums.reduce(0, ^)
        let bigger = nums.reduce(0) { result, current in
            let opposite = current ^ xor
            return current > opposite
                ? result ^ current
                : result
        }
        let smaller = bigger ^ xor
        return [smaller, bigger]
    }
}

