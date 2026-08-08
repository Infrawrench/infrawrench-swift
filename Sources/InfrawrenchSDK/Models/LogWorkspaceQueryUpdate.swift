/*
 * InfrawrenchSDK v0.44.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.44.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LogWorkspaceQueryUpdate: Codable, Hashable, Sendable {
    public var name: String?
    public var resources: [LogStreamSelector]?
    /// The search expression. Empty matches every line; `/pattern/` (optionally
    /// `/pattern/i`) is a regular expression; otherwise whitespace-separated
    /// terms that must ALL appear in a line (case-insensitive), with `"quoted
    /// phrases"` and `-term` negation.
    public var search: String?
    public var alertEnabled: Bool?

    public init(
        name: String? = nil,
        resources: [LogStreamSelector]? = nil,
        search: String? = nil,
        alertEnabled: Bool? = nil
    ) {
        self.name = name
        self.resources = resources
        self.search = search
        self.alertEnabled = alertEnabled
    }
}
