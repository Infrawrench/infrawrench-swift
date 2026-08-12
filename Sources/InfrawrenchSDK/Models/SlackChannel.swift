/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SlackChannel: Codable, Hashable, Sendable {
    public var id: String
    public var installationId: String
    /// Slack channel id (C…/G…)
    public var channelId: String
    /// Channel name without the leading #
    public var channelName: String
    public var isPrivate: Bool

    public init(
        id: String,
        installationId: String,
        channelId: String,
        channelName: String,
        isPrivate: Bool
    ) {
        self.id = id
        self.installationId = installationId
        self.channelId = channelId
        self.channelName = channelName
        self.isPrivate = isPrivate
    }
}
