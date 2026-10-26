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

/// Where a KPI's figure comes from. A saved report brings its filters, saved
/// filter, cost basis and billing-rule choice; `unit_cost` and `business_metric`
/// need a report with a business metric attached, `count` a report grouped by a
/// dimension. A budget follows its own period. Commitment coverage and
/// utilization are read over the commitments service's trailing window; `savings`
/// is the realized savings of kind `commitment`.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum KpiWidgetSource: Codable, Hashable, Sendable {
    public struct KpiWidgetSourceObject: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case costReport
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cost_report": self = .costReport
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .costReport: return "cost_report"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .costReport,
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
            case cost
            case usage
            case count
            case unitCost
            case businessMetric
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cost": self = .cost
                case "usage": self = .usage
                case "count": self = .count
                case "unit_cost": self = .unitCost
                case "business_metric": self = .businessMetric
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .cost: return "cost"
                case .usage: return "usage"
                case .count: return "count"
                case .unitCost: return "unit_cost"
                case .businessMetric: return "business_metric"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Measure] = [
                .cost,
                .usage,
                .count,
                .unitCost,
                .businessMetric,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Aggregation: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case sum
            case dailyAverage
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "sum": self = .sum
                case "daily_average": self = .dailyAverage
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .sum: return "sum"
                case .dailyAverage: return "daily_average"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Aggregation] = [
                .sum,
                .dailyAverage,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var reportId: String
        public var measure: Measure
        public var aggregation: Aggregation
        public var usageUnit: String?

        public init(
            kind: Kind,
            reportId: String,
            measure: Measure,
            aggregation: Aggregation,
            usageUnit: String? = nil
        ) {
            self.kind = kind
            self.reportId = reportId
            self.measure = measure
            self.aggregation = aggregation
            self.usageUnit = usageUnit
        }
    }

    public struct KpiWidgetSourceObject2: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case budget
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "budget": self = .budget
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .budget: return "budget"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .budget,
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
            case actual
            case forecast
            case remaining
            case percentUsed
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "actual": self = .actual
                case "forecast": self = .forecast
                case "remaining": self = .remaining
                case "percent_used": self = .percentUsed
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .actual: return "actual"
                case .forecast: return "forecast"
                case .remaining: return "remaining"
                case .percentUsed: return "percent_used"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Measure] = [
                .actual,
                .forecast,
                .remaining,
                .percentUsed,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var budgetId: String
        public var measure: Measure

        public init(
            kind: Kind,
            budgetId: String,
            measure: Measure
        ) {
            self.kind = kind
            self.budgetId = budgetId
            self.measure = measure
        }
    }

    public struct KpiWidgetSourceObject3: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case commitments
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "commitments": self = .commitments
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .commitments: return "commitments"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .commitments,
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
            case coverage
            case utilization
            case savings
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "coverage": self = .coverage
                case "utilization": self = .utilization
                case "savings": self = .savings
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .coverage: return "coverage"
                case .utilization: return "utilization"
                case .savings: return "savings"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Measure] = [
                .coverage,
                .utilization,
                .savings,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var measure: Measure

        public init(
            kind: Kind,
            measure: Measure
        ) {
            self.kind = kind
            self.measure = measure
        }
    }

    public struct KpiWidgetSourceObject4: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case realizedSavings
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "realized_savings": self = .realizedSavings
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .realizedSavings: return "realized_savings"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .realizedSavings,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum EventKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case rightsizing
            case orphanDeletion
            case sleepSchedule
            case commitment
            case saasSeat
            case manual
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "rightsizing": self = .rightsizing
                case "orphan_deletion": self = .orphanDeletion
                case "sleep_schedule": self = .sleepSchedule
                case "commitment": self = .commitment
                case "saas_seat": self = .saasSeat
                case "manual": self = .manual
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .rightsizing: return "rightsizing"
                case .orphanDeletion: return "orphan_deletion"
                case .sleepSchedule: return "sleep_schedule"
                case .commitment: return "commitment"
                case .saasSeat: return "saas_seat"
                case .manual: return "manual"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [EventKind] = [
                .rightsizing,
                .orphanDeletion,
                .sleepSchedule,
                .commitment,
                .saasSeat,
                .manual,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var eventKind: EventKind?

        public init(
            kind: Kind,
            eventKind: EventKind? = nil
        ) {
            self.kind = kind
            self.eventKind = eventKind
        }
    }

    case object(KpiWidgetSourceObject)
    case object2(KpiWidgetSourceObject2)
    case object3(KpiWidgetSourceObject3)
    case object4(KpiWidgetSourceObject4)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(KpiWidgetSourceObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(KpiWidgetSourceObject2.self) {
            self = .object2(value)
            return
        }
        if let value = try? container.decode(KpiWidgetSourceObject3.self) {
            self = .object3(value)
            return
        }
        if let value = try? container.decode(KpiWidgetSourceObject4.self) {
            self = .object4(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .object3(let value): try container.encode(value)
        case .object4(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
