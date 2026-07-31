/*
 * InfrawrenchSDK v0.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DigestSettings: Codable, Hashable, Sendable {
    /// Whether the weekly digest is enabled for this organization. Delivery
    /// targets are the Slack channels and Teams webhooks whose weeklyDigest
    /// trigger is on.
    public var enabled: Bool
    /// Monday (ISO date, UTC) of the last week a digest covered, or null when
    /// none has been sent.
    public var lastSentWeekStart: String?
    /// When the last digest was sent, or null when none has been sent.
    public var lastSentAt: String?

    public init(
        enabled: Bool,
        lastSentWeekStart: String? = nil,
        lastSentAt: String? = nil
    ) {
        self.enabled = enabled
        self.lastSentWeekStart = lastSentWeekStart
        self.lastSentAt = lastSentAt
    }
}
