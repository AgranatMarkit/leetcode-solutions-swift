class Solution {
    // Space O(n)
    // Time O(n)
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            if let f = operation(token) {
                let second = stack.removeLast()
                let first = stack.removeLast()
                stack.append(f(first, second))
            } else {
                stack.append(Int(token)!)
            }
        }
        return stack.removeLast()
    }
    
    typealias Operation = (Int, Int) -> Int
    func operation(_ token: String) -> Operation? {
        switch token {
        case "+":
            return { $0 + $1 }
        case "-":
            return { $0 - $1 }
        case "*":
            return { $0 * $1 }
        case "/":
            return { $0 / $1 }
        default:
            return nil
        }
    }
}
