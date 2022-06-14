class Solution {
    func longestPalindrome(_ s: String) -> String {
        longestPalindrome(Array(s))
    }
    
    func longestPalindrome(_ s: [Character]) -> String {
        var longestStart = 0
        var longestEnd = 0
        for i in 0..<s.count {
            var start = i
            var end = start
            while start > 0 && end < s.count - 1 && s[start - 1] == s[end + 1] {
                start -= 1
                end += 1
            }
            if (end - start + 1) > (longestEnd - longestStart + 1) {
                longestStart = start
                longestEnd = end
            }
            
            guard i < s.count - 1 && s[i] == s[i + 1] else { continue }
            start = i
            end = start + 1
            while start > 0 && end < s.count - 1 && s[start - 1] == s[end + 1] {
                start -= 1
                end += 1
            }
            if (end - start + 1) > (longestEnd - longestStart + 1) {
                longestStart = start
                longestEnd = end
            }
        }
        
        var longestSubstring = ""
        for i in 0..<s.count {
            guard i >= longestStart && i <= longestEnd else { continue }
            longestSubstring.append(s[i])
        }
        return longestSubstring
    }
}
