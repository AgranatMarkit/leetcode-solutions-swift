class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        let minimum = -2147483648
        var m1 = minimum, m2 = minimum, m3 = minimum
        var m1ready = false, m2ready = false, m3ready = false
        for x in nums {
            if !m1ready || x > m1 {
                if m2ready {
                    m3ready = true
                    m3 = m2
                }
                if m1ready {
                    m2ready = true
                    m2 = m1
                }
                m1ready = true
                m1 = x
            } else if m1 != x && (!m2ready || x > m2) {
                if m2ready {
                    m3ready = true
                    m3 = m2
                }
                m2ready = true
                m2 = x
            } else if m1 != x && m2 != x && (!m3ready || x > m3) {
                m3ready = true
                m3 = x
            }
        }
        
        return m3ready ? m3 : m1
    }
}
