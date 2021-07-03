class Solution {
    // Time O(n)
    // Space O(n)
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var days = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]()
        for i in stride(from: temperatures.count-1, to: -1, by: -1) {
            while !stack.isEmpty && temperatures[i] >= temperatures[stack.last!] {
                stack.removeLast()
            }
            if let warmerIdx = stack.last {
                days[i] = warmerIdx - i
            }
            stack.append(i)
        }
        return days
    }
}
