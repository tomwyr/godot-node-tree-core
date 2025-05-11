import Foundation

@_cdecl("generateNodeTree")
public func generateNodeTree(projectPath: UnsafePointer<CChar>, validateProjectPath: Bool)
  -> UnsafeMutablePointer<CChar>
{
  let projectPath = String(cString: projectPath)
  let result = Result { () throws(GodotNodeTreeError) in
    try NodeTreeGenerator().generate(
      projectPath: projectPath,
      validateProjectPath: validateProjectPath,
    )
  }
  return strdup(result.jsonEncoded())
}
