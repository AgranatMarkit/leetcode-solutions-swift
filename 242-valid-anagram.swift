class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        s.sorted() == t.sorted()
    }
}

