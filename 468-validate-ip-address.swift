class Solution {
    func validIPAddress(_ queryIP: String) -> String {
        if validIPv4Address(queryIP) {
            return "IPv4"
        }
        if validIPv6Address(queryIP) {
            return "IPv6"
        }
        return "Neither"
    }
    
    func validIPv4Address(_ queryIP: String) -> Bool {
        if queryIP.count < 7 || queryIP.count > 15 {
            return false
        }
        var tokensCount = 0
        var token = ""
        for c in queryIP {
            if c != "." {
                token.append(c)
                continue
            }
            if !isIPv4Token(token) {
                return false
            }
            tokensCount += 1
            token = ""
        }
        if !isIPv4Token(token) {
            return false
        }
        tokensCount += 1
        return tokensCount == 4
    }
    
    func isIPv4Token(_ token: String) -> Bool {
        guard let tokenValue = Int(token) else { return false }
        return tokenValue >= 0 &&
               tokenValue <= 255 &&
               (tokenValue > 0 || token.count == 1) &&
               (tokenValue == 0 || token.first != "0")
    }
    
    func validIPv6Address(_ queryIP: String) -> Bool {
        if queryIP.count < 15 || queryIP.count > 39 {
            return false
        }
        var tokensCount = 0
        var token = ""
        for c in queryIP {
            if c == ":" {
                if !isIPv6Token(token) {
                    return false
                }
                tokensCount += 1
                token = ""
            } else if !isIPv6Char(c) {
                return false
            } else {
                token.append(c)
            }
        }
        if !isIPv6Token(token) {
            return false
        }
        tokensCount += 1
        return tokensCount == 8
    }
    
    func isIPv6Token(_ token: String) -> Bool {
        token.count >= 1 && token.count <= 4
    }
    
    func isIPv6Char(_ character: Character) -> Bool {
        guard let c = character.asciiValue else { return false }
        return (c >= ascii("0") && c <= ascii("9")) ||
               (c >= ascii("a") && c <= ascii("f")) ||
               (c >= ascii("A") && c <= ascii("F"))
    }
    
    func ascii(_ s: String) -> UInt8 {
        s.first!.asciiValue!
    }
}