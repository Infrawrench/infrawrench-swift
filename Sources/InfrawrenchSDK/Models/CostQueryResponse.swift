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

public struct CostQueryResponse: Codable, Hashable, Sendable {
    public enum Measure: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case usage
        case count
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "usage": self = .usage
            case "count": self = .count
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .usage: return "usage"
            case .count: return "count"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Measure] = [
            .usage,
            .count,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var series: [CostQuerySeries]
    public var comparison: [CostQuerySeries]?
    /// The **unadjusted trend** projection. Stays the trend even when a scenario
    /// is applied, so a reader can always see what the fit said before anybody's
    /// assumptions touched it.
    public var forecast: [CostSeriesPoint]?
    public var scenario: CostScenarioResult?
    public var currencies: [String]
    /// Period total per currency, and always exactly the sum of `series`.
    /// Fixed-amount billing-rule charges are deliberately **not** folded in here;
    /// they have no series behind them and are reported in
    /// `adjustment.fixedTotals` instead.
    public var totals: [String: Double]
    public var previousTotals: [String: Double]?
    public var adjustment: CostAdjustmentSummary?
    /// Set when the request measured something other than money; absent means
    /// every amount is money in its series' currency. For both, series carry
    /// `currency: ""` and the totals are keyed by `""`.
    public var measure: Measure?
    /// The unit a `usage` response is in.
    public var usageUnit: String?

    public init(
        series: [CostQuerySeries],
        comparison: [CostQuerySeries]? = nil,
        forecast: [CostSeriesPoint]? = nil,
        scenario: CostScenarioResult? = nil,
        currencies: [String],
        totals: [String: Double],
        previousTotals: [String: Double]? = nil,
        adjustment: CostAdjustmentSummary? = nil,
        measure: Measure? = nil,
        usageUnit: String? = nil
    ) {
        self.series = series
        self.comparison = comparison
        self.forecast = forecast
        self.scenario = scenario
        self.currencies = currencies
        self.totals = totals
        self.previousTotals = previousTotals
        self.adjustment = adjustment
        self.measure = measure
        self.usageUnit = usageUnit
    }
}
