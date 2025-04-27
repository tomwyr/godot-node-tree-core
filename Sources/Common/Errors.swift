enum GodotNodeTreeError: Error, Codable {
  case scanningScenesFailed(projectPath: String)
  case readingSceneFailed(scenePath: String)
  case unexpectedNodeParameters(nodeParams: NodeParams)
  case unexpectedSceneResource(instance: String)
  case parentNodeNotFound(sceneName: String)
}
