class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var index = [Character: Int]()
        for (i, c) in s.enumerated() {
            index[c] = i
        }
        var result = [Character]()
        var charset = Set<Character>()
        for (i, c) in s.enumerated() {
            if charset.contains(c) {
                continue
            }
            while !result.isEmpty && i < index[result.last!]! && c < result.last! {
                charset.remove(result.last!)
                result.removeLast()
            }
            charset.insert(c)
            result.append(c)
        }
        return String(result)
    }
}