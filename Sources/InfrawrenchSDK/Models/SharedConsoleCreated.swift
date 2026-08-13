/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SharedConsoleCreated: Codable, Hashable, Sendable {
    public var share: SharedConsole
    public var participants: [SharedConsoleParticipant]
    /// The invite, returned exactly once. Only its sha256 is stored, so it cannot
    /// be shown again — mint a replacement instead.
    public var inviteToken: String

    public init(
        share: SharedConsole,
        participants: [SharedConsoleParticipant],
        inviteToken: String
    ) {
        self.share = share
        self.participants = participants
        self.inviteToken = inviteToken
    }
}
