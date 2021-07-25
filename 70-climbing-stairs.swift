class Solution {
    // Recursive solution with memoization
    // Time O(n)
    // Space O(n)
    func climbStairs(_ n: Int) -> Int {
        helper(1, 2, n)
    }
    
    func helper(_ first: Int, _ second: Int, _ n: Int) -> Int {
        if n == 1 {
            return first
        } else {
            return helper(second, first + second, n - 1)
        }
    }
}
