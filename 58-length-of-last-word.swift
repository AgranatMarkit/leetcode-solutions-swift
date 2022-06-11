class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var iterator = s.makeIterator()
        var lastWordLen = 0
        var currentWordlen = 0
        var curr = iterator.next()
        while curr != nil {
            if curr == " " {
                if currentWordlen != 0 {
                    lastWordLen = currentWordlen
                }
                currentWordlen = 0
            } else {
                currentWordlen += 1
            }
            curr = iterator.next()
        }
        return currentWordlen != 0 ? currentWordlen : lastWordLen
    }
}
