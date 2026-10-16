/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `budget.threshold.crossed` event, version 1. A budget's actual or
/// forecast spend (or usage) reached one of its alert thresholds.
public struct EventData_budget_threshold_crossed_v1: Codable, Hashable, Sendable {
    public enum ThresholdType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case actual
        case forecast
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "actual": self = .actual
            case "forecast": self = .forecast
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .actual: return "actual"
            case .forecast: return "forecast"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ThresholdType] = [
            .actual,
            .forecast,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Measure: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case spend
        case usage
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "spend": self = .spend
            case "usage": self = .usage
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .spend: return "spend"
            case .usage: return "usage"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Measure] = [
            .spend,
            .usage,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Budget id.
    public var budgetId: String
    /// Budget name.
    public var budgetName: String
    /// The budget period the threshold fired in.
    public var periodKey: String
    /// First day of the period (YYYY-MM-DD); null for a calendar month.
    public var periodStart: String?
    /// Last day of the period (YYYY-MM-DD); null for a calendar month.
    public var periodEnd: String?
    /// Whether actual or forecast crossed.
    public var thresholdType: ThresholdType
    /// The threshold, as a percent of the limit.
    public var thresholdPercent: Double
    /// A spend budget or a usage budget.
    public var measure: Measure
    /// The observed figure: cents for spend, units for usage.
    public var observed: Double
    /// The budget's limit, in the same unit as `observed`.
    public var limit: Double
    /// ISO 4217 code for a spend budget.
    public var currency: String?

    public init(
        budgetId: String,
        budgetName: String,
        periodKey: String,
        periodStart: String? = nil,
        periodEnd: String? = nil,
        thresholdType: ThresholdType,
        thresholdPercent: Double,
        measure: Measure,
        observed: Double,
        limit: Double,
        currency: String? = nil
    ) {
        self.budgetId = budgetId
        self.budgetName = budgetName
        self.periodKey = periodKey
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.thresholdType = thresholdType
        self.thresholdPercent = thresholdPercent
        self.measure = measure
        self.observed = observed
        self.limit = limit
        self.currency = currency
    }
}
