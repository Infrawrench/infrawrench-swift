/*
 * InfrawrenchSDK v1.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LogsResponse: Codable, Hashable, Sendable {
    /// Raw log text; each entry keeps its trailing newline.
    public var text: String
    /// Container names available for this resource — drives the container picker.
    public var containers: [String]
    /// Container `text` was read from.
    public var activeContainer: String

    public init(
        text: String,
        containers: [String],
        activeContainer: String
    ) {
        self.text = text
        self.containers = containers
        self.activeContainer = activeContainer
    }
}
