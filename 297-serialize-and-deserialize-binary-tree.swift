/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    typealias Node = TreeNode
    
    // Time O(n)
    // Space O(n)
    func serialize(_ root: Node?) -> String {
        guard let root = root else { return "" }
        var result = "\(root.val)"
        if root.left == nil && root.right == nil {
            result += "b"
        } else if root.left == nil {
            result += "l,\(serialize(root.right))"
        } else if root.right == nil {
            result += "r,\(serialize(root.left))"
        } else {
            result += ",\(serialize(root.left))"
            result += ",\(serialize(root.right))"
        }
        return result
    }
    
    // Time O(n)
    // Space O(n)
    func deserialize(_ data: String) -> Node? {
        guard !data.isEmpty else { return nil }
        let components = data.components(separatedBy: ",")
        let reversed = components.reversed()
        var serialized = Array(reversed)
        return deserialize(data: &serialized)
    }
    
    func deserialize(data: inout [String]) -> Node? {
        guard !data.isEmpty else { return nil }
        var serializedNode = data.removeLast()
        let withoutBoth = serializedNode.last == "b"
        let withoutLeft = withoutBoth || serializedNode.last == "l"
        let withoutRight = withoutBoth || serializedNode.last == "r"
        if withoutLeft || withoutRight { serializedNode.removeLast() }
        var node = Node(Int(serializedNode)!)
        if !withoutLeft { node.left = deserialize(data: &data) }
        if !withoutRight { node.right = deserialize(data: &data) }
        return node
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
