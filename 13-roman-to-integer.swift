class Solution {
    func romanToInt(_ s: String) -> Int {
        var iterator = s.makeIterator()
        var sum = 0
        var curr = iterator.next()?.integerNum
        while curr != nil {
            let next = iterator.next()?.integerNum
            let (currNum, nextNum) = (curr!, next ?? 0)
            sum += nextNum > currNum ? -currNum : currNum
            curr = next
        }
        return sum
    }
}

extension Character {
    var integerNum: Int {
        switch self {
            case "I": return 1
            case "V": return 5
            case "X": return 10
            case "L": return 50
            case "C": return 100
            case "D": return 500
            case "M": return 1000
            default: return 0
        }
    }
}
