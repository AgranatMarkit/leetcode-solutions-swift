class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        if b.count > a.count {
            return addBinary(b, a)
        }
        var aIter = a.reversed().makeIterator()
        var bIter = b.reversed().makeIterator()
        var aVal = aIter.next()?.wholeNumberValue
        var bVal = bIter.next()?.wholeNumberValue
        var totalSum = ""
        var carry = 0
        while aVal != nil {
            let currSum = (aVal ?? 0) + (bVal ?? 0) + carry
            totalSum.append(String(currSum % 2))
            carry = currSum > 1 ? 1 : 0
            aVal = aIter.next()?.wholeNumberValue
            bVal = bIter.next()?.wholeNumberValue
        }
        if carry == 1 {
            totalSum.append("1")
        }
        return String(totalSum.reversed())
    }
}
