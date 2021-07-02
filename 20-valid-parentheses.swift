class Solution {
    // Time O(n)
    // Space O(n)
    func isValid(_ s: String) -> Bool {
        var stack = [String.Element]()
        for c in s {
            if isOpenBracket(c) {
                stack.append(c)
            } else {
                guard let bracket = stack.last,
                      isBalanced(bracket, c) else { return false }
                stack.removeLast()
            }
        }
        return stack.isEmpty
    }
    
    func isOpenBracket(_ c: String.Element) -> Bool {
        c == "(" || c == "[" || c == "{"
    }
    
    func isBalanced(_ open: String.Element, _ close: String.Element) -> Bool {
        open == "(" && close == ")" ||
        open == "[" && close == "]" ||
        open == "{" && close == "}"
    }
}
