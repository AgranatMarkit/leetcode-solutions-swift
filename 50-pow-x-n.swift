class Solution {
    // Recursive
    // Time O(log(n))
    // Space O(log(n))
    func myPow(_ x: Double, _ n: Int) -> Double {
        let x = n > -1 || x == 0 ? x : 1/x
        return helper(x, abs(n))
    }
    
    func helper(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        } else if n == 1 {
            return x
        } else if n % 2 != 0 {
            return x * helper(x, n - 1)
        } else {
            let half = helper(x, n / 2)
            return half * half
        }
    }
}
