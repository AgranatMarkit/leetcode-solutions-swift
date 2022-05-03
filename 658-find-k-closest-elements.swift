class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        let index = arr.findIndexOfElement(closestTo: x)
        var leftPtr = index
        var rightPtr = index
        for _ in 0..<k {
            guard leftPtr != rightPtr else {
                leftPtr -= 1
                rightPtr += 1
                continue
            }
            let leftDistance = leftPtr >= 0 ? x - arr[leftPtr] : Int.max
            let rightDistance = rightPtr < arr.count ? arr[rightPtr] - x : Int.max
            if leftDistance <= rightDistance {
                leftPtr -= 1
            } else {
                rightPtr += 1
            }
        }
        return arr.copy(from: leftPtr + 1, to: rightPtr - 1)
    }
}

extension Array where Element == Int {
    private func _distance(from: Int, to: Int) -> Int {
        to < from
        ? distance(from: to, to: from)
        : to - from
    }
    
    func copy(from: Int, to: Int) -> [Element] {
        var result = [Element]()
        for i in from...to {
            result.append(self[i])
        }
        return result
    }
    
    func findIndexOfElement(closestTo element: Int) -> Int {
        var result = 0
        for i in 1..<count {
            let newIndexDistance = _distance(from: element, to: self[i])
            let resultIndexDistance = _distance(from: element, to: self[result])
            if newIndexDistance < resultIndexDistance {
                result = i
            }
        }
        return result
    }
}
