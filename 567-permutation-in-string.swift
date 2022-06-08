class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        _checkInclusion(Array(s1), Array(s2))
    }
    
    private func _checkInclusion(_ s1: [Character], _ s2: [Character]) -> Bool {
        guard s1.count <= s2.count else { return false }
        var diffMap = [Character: Int]()
        var diff = 0
        for tail in 0..<s2.count {
            let s = tail < s1.count ? s1 : s2
            let head = tail < s1.count ? tail : tail - s1.count
            let oldHeadValue = diffMap[s[head]] ?? 0
            let newHeadValue = oldHeadValue + 1
            diffMap[s[head]] = newHeadValue
            if oldHeadValue == 0 { diff += 1 }
            if newHeadValue == 0 { diff -= 1 }
            
            let oldTailValue = diffMap[s2[tail]] ?? 0
            let newTailValue = oldTailValue - 1
            diffMap[s2[tail]] = newTailValue
            if oldTailValue == 0 { diff += 1 }
            if newTailValue == 0 { diff -= 1 }
            
            if tail >= (s1.count - 1) && diff == 0 { break }
        }
        return diff == 0
    }
}
