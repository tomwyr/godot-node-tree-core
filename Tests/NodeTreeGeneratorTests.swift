import Testing

@testable import GodotNodeTreeCore

@Suite struct NodeTreeGeneratorTests {
  @Test func simple() throws {
    let result = try generate(testCase: "simple")

    let expected = NodeTree(
      scenes: [
        .init(
          name: "Main",
          root: .parentNode(
            .init(
              name: "Root",
              type: "GridContainer",
              children: [
                .leafNode(.init(name: "Kotlin GDJ", type: "Label")),
                .leafNode(.init(name: "Java GDJ", type: "Label")),
                .leafNode(.init(name: "Kotlin source", type: "Label")),
                .leafNode(.init(name: "Java source", type: "Label")),
              ],
            )
          )
        )
      ],
    )

    #expect(result == expected)
  }

  @Test func sceneChanger() throws {
    let result = try generate(testCase: "scene-changer")

    let expected = NodeTree(
      scenes: [
        .init(
          name: "SceneA",
          root: .parentNode(
            .init(
              name: "SceneA",
              type: "Panel",
              children: [
                .leafNode(.init(name: "Label", type: "Label")),
                .leafNode(.init(name: "GoToScene", type: "Button")),
              ],
            )
          )
        ),
        .init(
          name: "SceneB",
          root: .parentNode(
            .init(
              name: "SceneB",
              type: "Panel",
              children: [
                .leafNode(.init(name: "Label", type: "Label")),
                .leafNode(.init(name: "GoToScene", type: "Button")),
              ],
            )
          )
        ),
      ],
    )

    #expect(result == expected)
  }

  @Test func physicsTest() throws {
    let result = try generate(testCase: "physics-test")

    let expected = NodeTree(
      scenes: [
        .init(
          name: "Main",
          root: .parentNode(
            .init(
              name: "Main",
              type: "Control",
              children: [
                .leafNode(.init(name: "TestsMenu", type: "MenuButton")),
                .leafNode(.init(name: "LabelControls", type: "Label")),
                .leafNode(.init(name: "LabelFPS", type: "Label")),
                .leafNode(.init(name: "LabelEngine", type: "Label")),
                .leafNode(.init(name: "LabelVersion", type: "Label")),
                .leafNode(.init(name: "LabelTest", type: "Label")),
                .leafNode(.init(name: "LabelPause", type: "Label")),
                .parentNode(
                  .init(
                    name: "PanelLog",
                    type: "Panel",
                    children: [
                      .leafNode(.init(name: "ButtonClear", type: "Button")),
                      .leafNode(.init(name: "CheckBoxScroll", type: "CheckButton")),
                      .parentNode(
                        .init(
                          name: "ScrollLog",
                          type: "ScrollContainer",
                          children: [
                            .parentNode(
                              .init(
                                name: "VBoxLog",
                                type: "VBoxContainer",
                                children: [
                                  .leafNode(.init(name: "LabelLog", type: "Label"))
                                ],
                              )
                            )
                          ],
                        )
                      ),
                    ],
                  )
                ),
              ],
            )
          )
        )
      ]
    )

    #expect(result == expected)
  }

  @Test func waypoints() throws {
    let result = try generate(testCase: "waypoints")

    let expected = NodeTree(
      scenes: [
        .init(
          name: "Main",
          root: .parentNode(
            .init(
              name: "Main",
              type: "Node3D",
              children: [
                .parentNode(
                  .init(
                    name: "BlueCube",
                    type: "MeshInstance3D",
                    children: [
                      .parentNode(
                        .init(
                          name: "WaypointAnchor",
                          type: "Marker3D",
                          children: [
                            .nestedScene(.init(name: "Waypoint", scene: "Waypoint"))
                          ],
                        )
                      )
                    ],
                  )
                ),
                .parentNode(
                  .init(
                    name: "GreenCube",
                    type: "MeshInstance3D",
                    children: [
                      .parentNode(
                        .init(
                          name: "WaypointAnchor",
                          type: "Marker3D",
                          children: [
                            .nestedScene(.init(name: "Waypoint", scene: "Waypoint"))
                          ],
                        )
                      )
                    ],
                  )
                ),
                .parentNode(
                  .init(
                    name: "YellowCube",
                    type: "MeshInstance3D",
                    children: [
                      .parentNode(
                        .init(
                          name: "WaypointAnchor",
                          type: "Marker3D",
                          children: [
                            .nestedScene(.init(name: "Waypoint", scene: "Waypoint"))
                          ],
                        )
                      )
                    ],
                  )
                ),
                .parentNode(
                  .init(
                    name: "RedCube",
                    type: "MeshInstance3D",
                    children: [
                      .parentNode(
                        .init(
                          name: "WaypointAnchor",
                          type: "Marker3D",
                          children: [
                            .nestedScene(.init(name: "Waypoint", scene: "Waypoint"))
                          ],
                        )
                      )
                    ],
                  )
                ),
                .leafNode(.init(name: "Camera3D", type: "Camera3D")),
                .leafNode(.init(name: "Label", type: "Label")),
                .leafNode(.init(name: "Ground", type: "MeshInstance3D")),
                .leafNode(.init(name: "WhiteCube", type: "MeshInstance3D")),
                .parentNode(
                  .init(
                    name: "Environment",
                    type: "WorldEnvironment",
                    children: [
                      .leafNode(.init(name: "Sun", type: "DirectionalLight3D"))
                    ],
                  )
                ),
              ],
            )
          )
        ),
        .init(
          name: "Waypoint",
          root: .parentNode(
            .init(
              name: "Waypoint",
              type: "Control",
              children: [
                .leafNode(.init(name: "Label", type: "Label")),
                .leafNode(.init(name: "Marker", type: "TextureRect")),
              ],
            )
          )
        ),
      ],
    )

    #expect(result == expected)
  }

  @Test func dodgeTheCreeps() throws {
    let result = try generate(testCase: "dodge-the-creeps")

    let expected = NodeTree(
      scenes: [
        .init(
          name: "HUD",
          root: .parentNode(
            .init(
              name: "HUD",
              type: "CanvasLayer",
              children: [
                .leafNode(.init(name: "ScoreLabel", type: "Label")),
                .leafNode(.init(name: "MessageLabel", type: "Label")),
                .leafNode(.init(name: "StartButton", type: "Button")),
                .leafNode(.init(name: "MessageTimer", type: "Timer")),
              ],
            )
          )
        ),
        .init(
          name: "Main",
          root: .parentNode(
            .init(
              name: "Main",
              type: "Node",
              children: [
                .leafNode(.init(name: "ColorRect", type: "ColorRect")),
                .nestedScene(.init(name: "Player", scene: "Player")),
                .leafNode(.init(name: "MobTimer", type: "Timer")),
                .leafNode(.init(name: "ScoreTimer", type: "Timer")),
                .leafNode(.init(name: "StartTimer", type: "Timer")),
                .leafNode(.init(name: "StartPosition", type: "Marker2D")),
                .parentNode(
                  .init(
                    name: "MobPath",
                    type: "Path2D",
                    children: [
                      .leafNode(.init(name: "MobSpawnLocation", type: "PathFollow2D"))
                    ],
                  )
                ),
                .nestedScene(.init(name: "HUD", scene: "HUD")),
                .leafNode(.init(name: "Music", type: "AudioStreamPlayer")),
                .leafNode(.init(name: "DeathSound", type: "AudioStreamPlayer")),
              ],
            )
          )
        ),
        .init(
          name: "Mob",
          root: .parentNode(
            .init(
              name: "Mob",
              type: "RigidBody2D",
              children: [
                .leafNode(.init(name: "AnimatedSprite2D", type: "AnimatedSprite2D")),
                .leafNode(.init(name: "CollisionShape2D", type: "CollisionShape2D")),
                .leafNode(
                  .init(name: "VisibleOnScreenNotifier2D", type: "VisibleOnScreenNotifier2D")),
              ],
            )
          )
        ),
        .init(
          name: "Player",
          root: .parentNode(
            .init(
              name: "Player",
              type: "Area2D",
              children: [
                .leafNode(.init(name: "AnimatedSprite2D", type: "AnimatedSprite2D")),
                .leafNode(.init(name: "CollisionShape2D", type: "CollisionShape2D")),
                .leafNode(.init(name: "Trail", type: "GPUParticles2D")),
              ],
            )
          )
        ),
      ],
    )

    #expect(result == expected)
  }

  private func generate(testCase: String) throws -> NodeTree {
    try NodeTreeGenerator().generate(
      projectPath: "Tests/Resources/\(testCase)",
      validateProjectPath: false,
    )
  }
}
