class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var res = 0
        for (pos, char) in columnTitle.reversed().enumerated() {
            let baseValue = Int(pow(26.0, Double(pos)))
            let columnValue = Int(char.asciiValue! - Character("A").asciiValue!) + 1
            res += baseValue * columnValue
        }
        return res
    }
}

