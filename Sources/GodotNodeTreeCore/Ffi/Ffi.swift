import Foundation

@_cdecl("generateNodeTree")
public func generateNodeTree(projectPath: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
  let projectPath = String(cString: projectPath)

  // Declare static function because Swift seems to be unable to detect error
  // exhaustiveness and concrete error types within closures.
  func resolveNodeTree() throws(FfiError<GodotNodeTreeError>) -> NodeTree {
    do {
      return try NodeTreeGenerator().generate(projectPath: projectPath)
    } catch {
      throw FfiError(cause: error, message: error.localizedDescription)
    }
  }
  let result = Result(resolveNodeTree)

  return strdup(result.jsonEncoded())
}

struct FfiError<Cause>: Error, Codable where Cause: Error & Codable {
  let cause: Cause
  let message: String
}
