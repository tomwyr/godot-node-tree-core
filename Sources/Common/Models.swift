import UnionCodable

struct SceneData {
  let name: String
  let content: String
}

struct NodeParams: Codable, Equatable {
  let name: String
  let type: String?
  let instance: String?
  let parent: String?
}

struct NodeTree: Codable, Equatable {
  let scenes: [Scene]
}

struct Scene: Codable, Equatable {
  let name: String
  let root: NodeType
}

@UnionCodable(discriminator: "nodeType")
enum NodeType: Codable, Equatable {
  case parentNode(ParentNode)
  case leafNode(LeafNode)
  case nestedScene(NestedScene)
}

protocol Node: Codable, Equatable {
  var name: String { get }
}

struct ParentNode: Node {
  let name: String
  let type: String
  let children: [NodeType]
}

struct LeafNode: Node {
  let name: String
  let type: String
}

struct NestedScene: Node {
  let name: String
  let scene: String
}
