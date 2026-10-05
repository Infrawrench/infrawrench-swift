/*
 * InfrawrenchSDK v1.70.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.70.0).
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
    public struct Label: Codable, Hashable, Sendable {
        public var key: String
        /// Null for values carrying no such label, or for `Other`.
        public var value: String?
        /// True for the fold of values past the group cap.
        public var other: Bool?

        public init(
            key: String,
            value: String? = nil,
            other: Bool? = nil
        ) {
            self.key = key
            self.value = value
            self.other = other
        }
    }

    public var currency: String
    /// Set when the query grouped by a label.
    public var label: Label?
    public var points: [UnitCostPoint]
    /// The period ratio: **summed numerator ÷ summed denominator**, not the mean
    /// of the per-bucket ratios — the mean weights a quiet Sunday exactly as
    /// heavily as a peak Monday. Only buckets that produced a ratio contribute,
    /// on both sides.
    public var overallValue: Double?
    public var overallCost: Double
    public var overallMetricValue: Double?
    public var overallAbsoluteMargin: Double?

    public init(
        currency: String,
        label: Label? = nil,
        points: [UnitCostPoint],
        overallValue: Double? = nil,
        overallCost: Double,
        overallMetricValue: Double? = nil,
        overallAbsoluteMargin: Double? = nil
    ) {
        self.currency = currency
        self.label = label
        self.points = points
        self.overallValue = overallValue
        self.overallCost = overallCost
        self.overallMetricValue = overallMetricValue
        self.overallAbsoluteMargin = overallAbsoluteMargin
    }
}
