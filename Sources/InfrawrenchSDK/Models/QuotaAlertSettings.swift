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

public struct QuotaAlertSettings: Codable, Hashable, Sendable {
    /// Whether the poller sends quota alerts for this organization at all.
    public var enabled: Bool
    /// Utilisation fraction at or above which a quota alerts. Default 0.8.
    /// Bounded below at 0.5 (a lower threshold makes every quota critical) and
    /// above at 0.99 (at 1.0 the provider is already refusing requests, so the
    /// alert reports an outage rather than warning about one). Values outside the
    /// range are rejected, not clamped.
    public var threshold: Double
    /// When the organization's quota alert scan last completed, or null before
    /// the first. Owned by the poller's cooldown claim; not writable through this
    /// API.
    public var lastNotifiedAt: String?

    public init(
        enabled: Bool,
        threshold: Double,
        lastNotifiedAt: String? = nil
    ) {
        self.enabled = enabled
        self.threshold = threshold
        self.lastNotifiedAt = lastNotifiedAt
    }
}
