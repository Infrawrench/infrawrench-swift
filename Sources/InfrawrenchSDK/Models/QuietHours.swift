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

/// A recurring local-time window during which the rule holds its alerts. Held,
/// not dropped — a held alert is queued and delivered when the window closes.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct QuietHours: Codable, Hashable, Sendable {
    /// IANA zone, e.g. Europe/Berlin
    public var timezone: String
    public var startMinute: Int
    /// May be less than startMinute for an overnight window. Equal means empty.
    public var endMinute: Int
    /// ISO weekdays the window applies on, matched against the day the window
    /// opened. Empty means every day.
    public var days: [Int]
    public var urgentOverride: AlertSeverity?

    public init(
        timezone: String,
        startMinute: Int,
        endMinute: Int,
        days: [Int],
        urgentOverride: AlertSeverity? = nil
    ) {
        self.timezone = timezone
        self.startMinute = startMinute
        self.endMinute = endMinute
        self.days = days
        self.urgentOverride = urgentOverride
    }
}
