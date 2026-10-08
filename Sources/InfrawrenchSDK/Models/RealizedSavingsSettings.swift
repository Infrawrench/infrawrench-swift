/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RealizedSavingsSettings: Codable, Hashable, Sendable {
    /// How long a one-off action keeps accruing, in months. Default 12.
    public var horizonMonths: Int
    /// Below this share of the projected rate an action is flagged short. Default
    /// 70.
    public var shortfallThresholdPercent: Int
    /// Days before the action whose spend makes up the baseline. Default 14.
    public var baselineWindowDays: Int

    public init(
        horizonMonths: Int,
        shortfallThresholdPercent: Int,
        baselineWindowDays: Int
    ) {
        self.horizonMonths = horizonMonths
        self.shortfallThresholdPercent = shortfallThresholdPercent
        self.baselineWindowDays = baselineWindowDays
    }
}
