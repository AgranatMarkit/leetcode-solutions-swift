class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var iterators = strs.map { $0.makeIterator() }
        var result = ""
        for i in 0..<200 {
            guard let character = iterators[0].next() else { break }
            var needStop = false
            for j in 1..<iterators.count {
                needStop = iterators[j].next() != character
                guard !needStop else { break }
            }
            guard !needStop else { break }
            result.append(character)
        }
        return result
    }
}
