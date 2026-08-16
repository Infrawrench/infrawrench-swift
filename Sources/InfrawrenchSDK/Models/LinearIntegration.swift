/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct LinearIntegration: Codable, Hashable, Sendable {
    /// Redacted marker for the stored personal API key, e.g. `…a7f2`. The key
    /// itself is never returned.
    public var keyHint: String
    /// Team the file-issue window preselects. A Linear team id, not a team key.
    public var defaultTeamId: String?
    public var updatedAt: String

    public init(
        keyHint: String,
        defaultTeamId: String? = nil,
        updatedAt: String
    ) {
        self.keyHint = keyHint
        self.defaultTeamId = defaultTeamId
        self.updatedAt = updatedAt
    }
}
