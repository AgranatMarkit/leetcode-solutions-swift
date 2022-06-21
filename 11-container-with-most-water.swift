class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var area = 0
        var b = 0
        var e = height.count - 1
        while b < e {
            let newArea: Int
            if height[b] < height[e] {
                area = max(area, height[b] * (e - b))
                b += 1
            } else {
                area = max(area, height[e] * (e - b))
                e -= 1
            }
        }
        return area
    }
}