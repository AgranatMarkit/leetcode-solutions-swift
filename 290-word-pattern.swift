class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        _wordPattern(Array(pattern), Array(s))
    }
    
    func _wordPattern(_ pattern: [Character], _ s: [Character]) -> Bool {
        var patternToToken = [Character: [Character]]()
        var tokenToPattern = [[Character]: Character]()
        var (i, j) = (0, 0)
        while i < pattern.count && j < s.count {
            var token = [Character]()
            while j < s.count && s[j] != " " {
                token.append(s[j])
                j += 1
            }
            if j < s.count && s[j] == " " {
                j += 1
            }
            
            if tokenToPattern[token] != nil && tokenToPattern[token] != pattern[i] {
                return false
            } else {
                tokenToPattern[token] = pattern[i]
            }

            if patternToToken[pattern[i]] != nil && patternToToken[pattern[i]] != token {
                return false
            } else {
                patternToToken[pattern[i]] = token
            }
            
            i += 1
        }
        return i == pattern.count && j == s.count
    }
}


