/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostForecastSeries: Codable, Hashable, Sendable {
    public struct Scenario: Codable, Hashable, Sendable {
        public struct Contribution: Codable, Hashable, Sendable {
            public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                case oneOff
                case recurring
                case rateChange
                /// A value the API added after this SDK was generated. Kept
                /// rather than rejected, so a new server-side value cannot break
                /// decoding.
                case unrecognized(String)

                public init(rawValue: String) {
                    switch rawValue {
                    case "one_off": self = .oneOff
                    case "recurring": self = .recurring
                    case "rate_change": self = .rateChange
                    default: self = .unrecognized(rawValue)
                    }
                }

                public var rawValue: String {
                    switch self {
                    case .oneOff: return "one_off"
                    case .recurring: return "recurring"
                    case .rateChange: return "rate_change"
                    case .unrecognized(let value): return value
                    }
                }

                /// Every value the spec declares. `unrecognized` is deliberately absent.
                public static let allKnownCases: [Kind] = [
                    .oneOff,
                    .recurring,
                    .rateChange,
                ]

                public init(from decoder: any Decoder) throws {
                    self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
                }

                public func encode(to encoder: any Encoder) throws {
                    var container = encoder.singleValueContainer()
                    try container.encode(rawValue)
                }
            }

            public var adjustmentId: String
            public var label: String
            public var kind: Kind
            public var amount: Double

            public init(
                adjustmentId: String,
                label: String,
                kind: Kind,
                amount: Double
            ) {
                self.adjustmentId = adjustmentId
                self.label = label
                self.kind = kind
                self.amount = amount
            }
        }

        public var modelId: String
        public var modelName: String
        /// What this model changed over the returned window.
        public var totalDelta: Double
        /// Per adjustment, from the day after the last observed day through `to`.
        public var contributions: [Contribution]
        public var outOfScope: [String]

        public init(
            modelId: String,
            modelName: String,
            totalDelta: Double,
            contributions: [Contribution],
            outOfScope: [String]
        ) {
            self.modelId = modelId
            self.modelName = modelName
            self.totalDelta = totalDelta
            self.contributions = contributions
            self.outOfScope = outOfScope
        }
    }

    public struct Driver: Codable, Hashable, Sendable {
        public var metricId: String
        public var metricName: String
        public var metricUnit: String
        public var unitCost: Double?
        public var metricTotal: Double
        public var coveredDays: Int
        public var totalDays: Int

        public init(
            metricId: String,
            metricName: String,
            metricUnit: String,
            unitCost: Double? = nil,
            metricTotal: Double,
            coveredDays: Int,
            totalDays: Int
        ) {
            self.metricId = metricId
            self.metricName = metricName
            self.metricUnit = metricUnit
            self.unitCost = unitCost
            self.metricTotal = metricTotal
            self.coveredDays = coveredDays
            self.totalDays = totalDays
        }
    }

    /// Null for the automatic (trend) forecast.
    public var forecastId: String?
    public var name: String
    public var isDefault: Bool
    public var points: [CostForecastPoint]
    public var total: CostForecastTotal
    /// `total.expected` minus the automatic forecast's, over the same window.
    public var deltaFromBaseline: Double
    public var scenarios: [Scenario]
    public var driver: Driver?
    public var warnings: [String]

    public init(
        forecastId: String? = nil,
        name: String,
        isDefault: Bool,
        points: [CostForecastPoint],
        total: CostForecastTotal,
        deltaFromBaseline: Double,
        scenarios: [Scenario],
        driver: Driver? = nil,
        warnings: [String]
    ) {
        self.forecastId = forecastId
        self.name = name
        self.isDefault = isDefault
        self.points = points
        self.total = total
        self.deltaFromBaseline = deltaFromBaseline
        self.scenarios = scenarios
        self.driver = driver
        self.warnings = warnings
    }
}
