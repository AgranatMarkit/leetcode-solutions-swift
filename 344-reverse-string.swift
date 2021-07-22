class Solution {
    // Recursive Inplace Solution
    // Time O(n)
    // Space O(n)
    func reverseString(_ s: inout [Character]) {
        helper(0, &s)
    }
    
    func helper(_ index: Int, _ s: inout [Character]) {
        guard index < Int(s.count / 2) else { return }
        let tmp = s[index]
        let opposite = s.count - 1 - index
        s[index] = s[opposite]
        s[opposite] = tmp
        helper(index + 1, &s)
    }
}