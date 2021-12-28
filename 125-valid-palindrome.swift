class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let s = s.reduce(into: [UInt8]()) {
            if let c = $1.asciiValue, c.isNumeric || c.isLetter {
                $0.append(c.lowercased)
            }
        }
        let n = s.count
        return !(0..<n/2).contains(where: { s[$0] != s[n-1-$0] })
    }
}

extension UInt8 {
    var isNumeric: Bool {
        48 <= self && self <= 57
    }
    
    var isLetter: Bool {
        (65 <= self && self <= 90) ||
        (97 <= self && self <= 122)
    }
    
    var lowercased: UInt8 {
        65 <= self && self <= 90
        ? self + 32
        : self
    }
}
