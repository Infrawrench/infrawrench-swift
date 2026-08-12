/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct QuotaTrend: Codable, Hashable, Sendable {
    /// Least-squares change in utilisation fraction per day over the last 14 days
    /// of snapshots. Null when fewer than 3 readings exist, or when every reading
    /// shares an instant. Null means 'not enough history', never 'no risk'.
    public var perDay: Double?
    /// Days until used reaches limit at the fitted rate. Null when the trend is
    /// flat or falling, when the quota is already at its limit, or when
    /// exhaustion lands beyond the 30-day horizon.
    public var daysToExhaustion: Double?
    /// Snapshots the fit used.
    public var points: Int

    public init(
        perDay: Double? = nil,
        daysToExhaustion: Double? = nil,
        points: Int
    ) {
        self.perDay = perDay
        self.daysToExhaustion = daysToExhaustion
        self.points = points
    }
}
