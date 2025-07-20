import Foundation

struct GodotProjectReader {
  func readScenes(projectPath: String) throws(GodotNodeTreeError) -> [SceneData] {
    return try scanScenes(projectPath).map { file throws(GodotNodeTreeError) in
      let fileName = file.deletingPathExtension().lastPathComponent
      let name = fileName.split(separator: /[-_]/)
        .map(\.firstCapitalized)
        .joined()
      let content = try readScene(file)
      return SceneData(name: name, content: content)
    }.sorted(by: { $0.name <= $1.name })
  }

  private func scanScenes(_ projectPath: String) throws(GodotNodeTreeError) -> [URL] {
    do {
      let directory = URL(fileURLWithPath: projectPath).deletingLastPathComponent()
      return try directory.walkTopDown(includeHidden: false).filter { $0.pathExtension == "tscn" }
    } catch {
      throw .scanningScenesFailed(projectPath: projectPath)
    }
  }

  private func readScene(_ file: URL) throws(GodotNodeTreeError) -> String {
    do {
      return try String(contentsOf: file, encoding: .utf8)
    } catch {
      throw .readingSceneFailed(scenePath: file.absoluteString)
    }
  }
}
