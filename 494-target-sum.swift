// Recursion with memoisation
// Time O(l*n)
// Space O(l*n)
// l is sum range, and n is depth of recursion
class Solution {
    var memory = [String: Int]()
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        findTargetSumWays(nums, target, 0, 0)
    }
    
    func findTargetSumWays(_ nums: [Int], _ target: Int, _ i: Int, _ sum: Int) -> Int {
        if i == nums.count {
            if sum == target {
                return 1
            } else {
                return 0
            }
        } else {
            let key = "\(i) \(sum)"
            if let value = memory[key] {
                return value
            }
            let result = findTargetSumWays(nums, target, i + 1, sum + nums[i]) +
                         findTargetSumWays(nums, target, i + 1, sum - nums[i])
            memory[key] = result
            return result
        }
    }
}

// Iterative approach using 4 stacks
//class Solution {
//    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
//        var memory = [String: Int]()
//        var stackIndex = [0]
//        var stackSum = [0]
//        var stackIndex2 = [Int]()
//        var stackSum2 = [Int]()
//        var ways = 0
//        while !stackIndex.isEmpty {
//            let index = stackIndex.removeLast()
//            let sum = stackSum.removeLast()
//            let key = "\(index) \(sum)"
//            if let value = memory[key] {
//                ways += value
//            } else if index == nums.count {
//                if sum == target {
//                    ways += 1
//                    memory[key] = 1
//                } else {
//                    memory[key] = 0
//                }
//            } else {
//                stackIndex.append(index + 1)
//                stackIndex.append(index + 1)
//                stackSum.append(sum + nums[index])
//                stackSum.append(sum - nums[index])
//
//                stackIndex2.append(index)
//                stackSum2.append(sum)
//            }
//
//            while !stackIndex2.isEmpty {
//                let parentIndex = stackIndex2.last!
//                let parentSum = stackSum2.last!
//                let childrenIndex = parentIndex + 1
//                let addKey = "\(childrenIndex) \(parentSum + nums[parentIndex])"
//                let subKey = "\(childrenIndex) \(parentSum - nums[parentIndex])"
//                if let addValue = memory[addKey],
//                   let subValue = memory[subKey]
//                {
//                    memory["\(parentIndex) \(parentSum)"] = addValue + subValue
//                    stackIndex2.removeLast()
//                    stackSum2.removeLast()
//                } else {
//                    break
//                }
//            }
//        }
//        return ways
//    }
//}
