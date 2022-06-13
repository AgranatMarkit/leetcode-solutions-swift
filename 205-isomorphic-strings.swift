class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var (spos, tpos) = ([Character: Int](), [Character: Int]())
        var (siter, titer) = (s.makeIterator(), t.makeIterator())
        var i = 0
        while let scurr = siter.next(), let tcurr = titer.next(), spos[scurr] == tpos[tcurr] {
            (spos[scurr], tpos[tcurr]) = (i, i)
            i += 1
        }
        return i == s.count
    }
}