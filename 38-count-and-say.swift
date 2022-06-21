class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        var say = countAndSay(n - 1)
        var result = ""
        var prev: Character? = nil
        var count = 0
        for c in say {
            if count > 0 && prev != c {
                result += "\(count)\(prev!)"
                count = 1
            } else {
                count += 1
            }
            prev = c
        }
        result += "\(count)\(prev!)"
        return result
    }
}