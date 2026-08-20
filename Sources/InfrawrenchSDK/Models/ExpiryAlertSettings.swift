/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExpiryAlertSettings: Codable, Hashable, Sendable {
    /// Whether the poller sends expiry alerts for this organization at all.
    public var enabled: Bool
    /// Days of lead time before a deadline counts as `upcoming` and alertable.
    /// Default 60.
    public var leadDays: Int
    /// When the organization's expiry alert scan last completed, or null before
    /// the first. Owned by the poller's cooldown claim; not writable through this
    /// API.
    public var lastNotifiedAt: String?

    public init(
        enabled: Bool,
        leadDays: Int,
        lastNotifiedAt: String? = nil
    ) {
        self.enabled = enabled
        self.leadDays = leadDays
        self.lastNotifiedAt = lastNotifiedAt
    }
}
