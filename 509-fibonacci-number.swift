class Solution {
    // Recursive solution
    // Time O(n)
    // Space O(n)
    func fib(_ n: Int) -> Int {
        helper(0, 1, n)
    }
    
    func helper(_ first: Int, _ second: Int, _ n: Int) -> Int {
        if n == 0 {
            return first
        } else {
            return helper(second, first + second, n - 1)
        }
    }
}
