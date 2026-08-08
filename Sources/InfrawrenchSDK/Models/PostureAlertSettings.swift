/*
 * InfrawrenchSDK v0.43.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.43.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PostureAlertSettings: Codable, Hashable, Sendable {
    /// Whether the poller sends posture alerts for this organization at all.
    public var enabled: Bool
    /// When the organization's posture alert scan last completed, or null before
    /// the first. Owned by the poller's cooldown claim; not writable through this
    /// API.
    public var lastNotifiedAt: String?

    public init(
        enabled: Bool,
        lastNotifiedAt: String? = nil
    ) {
        self.enabled = enabled
        self.lastNotifiedAt = lastNotifiedAt
    }
}
