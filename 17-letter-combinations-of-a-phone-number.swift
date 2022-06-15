class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var result = [String]()
        for d in digits {
            let alphabet = getAlphabet(d)
            if result.isEmpty {
                alphabet.forEach { result.append($0) }
                continue
            }
            var newResult = [String]()
            for c1 in result {
                for c2 in alphabet {
                    newResult.append(c1 + c2)
                }
            }
            result = newResult
        }
        return result
    }
    
    func getAlphabet(_ c: Character) -> [String] {
        let str: String
        switch c {
            case "2": str = "abc"
            case "3": str = "def"
            case "4": str = "ghi"
            case "5": str = "jkl"
            case "6": str = "mno"
            case "7": str = "pqrs"
            case "8": str = "tuv"
            case "9": str = "wxyz"
            default: str = ""
        }
        return str.map { String($0) }
    }
}