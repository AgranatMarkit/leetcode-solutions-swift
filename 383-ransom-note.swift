class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        if ransomNote.count > magazine.count {
            return false
        }
        var charFreq = ransomNote.reduce(into: [Character: Int]()) {
            $0[$1] = $0[$1, default: 0] - 1
        }
        for c in magazine {
            if let freq = charFreq[c] {
                charFreq[c] = freq + 1
            }
        }
        return !ransomNote.contains {
            charFreq[$0, default: 0] < 0
        }
    }
}

