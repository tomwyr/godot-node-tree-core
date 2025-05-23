import UnionCodable

@UnionCodable(discriminator: "errorType")
enum GodotNodeTreeError: Error, Codable {
  case invalidGodotProject(projectPath: String)
  case scanningScenesFailed(projectPath: String)
  case readingSceneFailed(scenePath: String)
  case unexpectedNodeParameters(nodeParams: NodeParams)
  case unexpectedSceneResource(instance: String)
  case parentNodeNotFound(sceneName: String)
}
