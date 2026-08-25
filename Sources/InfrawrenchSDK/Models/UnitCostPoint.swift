/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct UnitCostPoint: Codable, Hashable, Sendable {
    public enum Gap: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case noMetricValue
        case nonPositiveMetricValue
        case unconvertibleCurrency
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "no_metric_value": self = .noMetricValue
            case "non_positive_metric_value": self = .nonPositiveMetricValue
            case "unconvertible_currency": self = .unconvertibleCurrency
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .noMetricValue: return "no_metric_value"
            case .nonPositiveMetricValue: return "non_positive_metric_value"
            case .unconvertibleCurrency: return "unconvertible_currency"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Gap] = [
            .noMetricValue,
            .nonPositiveMetricValue,
            .unconvertibleCurrency,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Bucket start date, YYYY-MM-DD.
    public var bucket: String
    /// The ratio, or **null for a gap**. Never 0 and never infinite: a bucket
    /// with no reported metric value is unknown, not free, and rendering it as 0
    /// would say the opposite of the truth. A zero numerator over a positive
    /// denominator is a real 0 and is returned as one.
    public var value: Double?
    /// Spend summed over the bucket, in the series' currency.
    public var cost: Double
    /// Metric value summed over the bucket, or null when nothing was reported.
    public var metricValue: Double?
    /// Set exactly when `value` is null.
    public var gap: Gap?
    /// Days in the bucket carrying a reported value, out of `bucketDays`. When it
    /// is smaller, the denominator covers only part of the bucket and the ratio
    /// there reads high.
    public var reportedDays: Int
    public var bucketDays: Int

    public init(
        bucket: String,
        value: Double? = nil,
        cost: Double,
        metricValue: Double? = nil,
        gap: Gap? = nil,
        reportedDays: Int,
        bucketDays: Int
    ) {
        self.bucket = bucket
        self.value = value
        self.cost = cost
        self.metricValue = metricValue
        self.gap = gap
        self.reportedDays = reportedDays
        self.bucketDays = bucketDays
    }
}
