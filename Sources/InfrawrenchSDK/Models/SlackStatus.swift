/*
 * InfrawrenchSDK v0.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SlackStatus: Codable, Hashable, Sendable {
    /// True when this deployment has a Slack app registered
    public var configured: Bool
    public var installations: [SlackInstallation]
    public var channels: [SlackChannel]

    public init(
        configured: Bool,
        installations: [SlackInstallation],
        channels: [SlackChannel]
    ) {
        self.configured = configured
        self.installations = installations
        self.channels = channels
    }
}
