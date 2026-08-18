/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SlackInstallation: Codable, Hashable, Sendable {
    /// Infrawrench id for this workspace connection
    public var id: String
    /// Slack workspace id (T…)
    public var teamId: String
    public var teamName: String?

    public init(
        id: String,
        teamId: String,
        teamName: String? = nil
    ) {
        self.id = id
        self.teamId = teamId
        self.teamName = teamName
    }
}
