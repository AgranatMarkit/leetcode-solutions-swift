class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        _findAnagrams(Array(s), Array(p))
    }
    
    func _findAnagrams(_ s: [Character], _ p: [Character]) -> [Int] {
        if p.count > s.count {
            return []
        }
        
        var diff = [Character: Int]()
        for c in p {
            diff[c] = (diff[c] ?? 0) + 1
        }
        
        for i in 0..<p.count {
            if let count = diff[s[i]] {
                diff[s[i]] = count - 1
            }
        }
        
        var diffSize = 0
        for count in diff.values {
            diffSize += abs(count)
        }
        
        var anagrams = [Int]()
        if diffSize == 0 {
            anagrams.append(0)
        }
        
        var tail = p.count
        while tail < s.count {
            let head = tail - p.count
            if let headCount = diff[s[head]] {
                diff[s[head]] = headCount + 1
                diffSize += abs(headCount + 1) - abs(headCount)
            }
            if let tailCount = diff[s[tail]] {
                diff[s[tail]] = tailCount - 1
                diffSize += abs(tailCount - 1) - abs(tailCount)
            }
            tail += 1
            if diffSize == 0 {
                anagrams.append(head + 1)
            }
        }
        
        return anagrams
    }
}
