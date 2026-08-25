/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct StatusHistoryDay: Codable, Hashable, Sendable {
    /// `YYYY-MM-DD`, UTC.
    public var day: String
    /// Fraction of the day the endpoint was up (0–1), or null when nothing was
    /// recorded.
    public var uptime: Double?

    public init(
        day: String,
        uptime: Double? = nil
    ) {
        self.day = day
        self.uptime = uptime
    }
}
