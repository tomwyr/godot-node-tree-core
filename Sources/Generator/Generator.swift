import Foundation

struct NodeTreeGenerator {
  let reader: GodotProjectReader
  let parser: GodotNodesParser

  init(
    reader: GodotProjectReader = GodotProjectReader(),
    parser: GodotNodesParser = GodotNodesParser()
  ) {
    self.reader = reader
    self.parser = parser
  }

  func generate(projectPath: String, validateProjectPath: Bool) throws(GodotNodeTreeError)
    -> NodeTree
  {
    if validateProjectPath {
      try validateInput(projectPath: projectPath)
    }
    let scenesData = try reader.readScenes(projectPath: projectPath)
    let scenes = try scenesData.map { data throws(GodotNodeTreeError) in
      let root = try parser.parse(sceneData: data)
      return Scene(name: data.name, root: root)
    }
    return NodeTree(scenes: scenes)
  }

  func validateInput(projectPath: String) throws(GodotNodeTreeError) {
    let projectFilePath = URL(filePath: projectPath).appending(component: "project.godot").path()
    guard FileManager.default.fileExists(atPath: projectFilePath) else {
      throw .invalidGodotProject(projectPath: projectPath)
    }
  }
}
