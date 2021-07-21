class Solution {
    // Time O(n)
    // Space O(n)
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var unvisited = Set<Int>()
        for i in 1..<rooms.count {
            unvisited.insert(i)
        }
        var stack = [0]
        while !stack.isEmpty {
            let room = stack.removeLast()
            for key in rooms[room] where unvisited.contains(key) {
                unvisited.remove(key)
                stack.append(key)
            }
        }
        return unvisited.isEmpty
    }
}
