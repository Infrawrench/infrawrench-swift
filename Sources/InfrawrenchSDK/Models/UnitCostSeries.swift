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

public struct UnitCostSeries: Codable, Hashable, Sendable {
    public var currency: String
    public var points: [UnitCostPoint]
    /// The period ratio: **summed numerator ÷ summed denominator**, not the mean
    /// of the per-bucket ratios — the mean weights a quiet Sunday exactly as
    /// heavily as a peak Monday. Only buckets that produced a ratio contribute,
    /// on both sides.
    public var overallValue: Double?
    public var overallCost: Double
    public var overallMetricValue: Double?

    public init(
        currency: String,
        points: [UnitCostPoint],
        overallValue: Double? = nil,
        overallCost: Double,
        overallMetricValue: Double? = nil
    ) {
        self.currency = currency
        self.points = points
        self.overallValue = overallValue
        self.overallCost = overallCost
        self.overallMetricValue = overallMetricValue
    }
}
