class Solution {
    // Time O(n)
    // Space O(n)
    func decodeString(_ s: String) -> String {
        var stack = Array(Array(s).reversed())
        
        var result = [Character]()
        
        while !stack.isEmpty {
            let curr = stack.removeLast()
            if !curr.isNumber {
                result.append(curr)
                continue
            }
            
            var kStr = "\(curr)"
            while stack.last!.isNumber {
                kStr += "\(stack.removeLast())"
            }
            let k = Int(kStr)!

            var tmp = [Character]()
            stack.removeLast()
            var openBrackets = 1
            while openBrackets > 0 {
                let curr = stack.removeLast()
                if curr == "[" {
                    openBrackets += 1
                }
                if curr == "]" {
                    openBrackets -= 1
                }
                if openBrackets > 0 {
                    tmp.append(curr)
                }
            }
            
            for _ in 0..<k {
                for c in tmp.reversed() {
                    stack.append(c)
                }
            }
        }
        
        return String(result)
    }
}
