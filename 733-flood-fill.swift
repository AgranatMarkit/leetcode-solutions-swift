class Solution {
    // Iterative solution
    // Time O(n)
    // Space O(n)
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let N = image.count
        let M = image[0].count
        var image = image
        let startColor = image[sr][sc]
        var stack = [[sr, sc]]
        var visited = createVisitedMap(N, M)
        
        func visit(_ r: Int, _ c: Int) {
            if !visited[r][c] && image[r][c] == startColor {
                stack.append([r, c])
            }
        }
        
        while !stack.isEmpty {
            let point = stack.removeLast()
            let r = point[0]
            let c = point[1]
    
            image[r][c] = newColor
            visited[r][c] = true
    
            visit(max(0, r - 1), c)
            visit(min(N - 1, r + 1), c)
            visit(r, max(0, c - 1))
            visit(r, min(M - 1, c + 1))
        }
        
        return image
    }
    
// Recursive solution
// Time O(n)
// Space O(n)
//     func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
//         let N = image.count
//         let M = image[0].count
//         var image = image
//         let startColor = image[sr][sc]
//         var visited = createVisitedMap(N, M)
        
//         func visit( _ r: Int, _ c: Int) {
//             if visited[r][c] || image[r][c] != startColor {
//                 return
//             }
            
//             visited[r][c] = true
//             image[r][c] = newColor

//             visit(r, max(0, c - 1))
//             visit(r, min(M - 1, c + 1))
//             visit(max(0, r - 1), c)
//             visit(min(N - 1, r + 1), c)
//         }

//         visit(sr, sc)
//         return image
//     }
    
    func createVisitedMap(_ N: Int, _ M: Int) -> [[Bool]] {
        var visited = [[Bool]]()
        for _ in 0..<N {
            var row = [Bool]()
            for _ in 0..<M {
                row.append(false)
            }
            visited.append(row)
        }
        return visited
    }
}
