//
//  File.swift
//  
//
//  Created by Kota Kawanishi on 2022/08/27.
//

import PackagePlugin

@main
struct SwiftLintPlugins: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        return [
            .buildCommand(
                displayName: "Linting \(target.name)",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    target.directory.string
                ],
                environment: [:]
            )
        ]
    }
}
