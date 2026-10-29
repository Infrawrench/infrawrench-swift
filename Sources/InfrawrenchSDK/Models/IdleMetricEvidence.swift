/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IdleMetricEvidence: Codable, Hashable, Sendable {
    public enum Statistic: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case sum
        case max
        case average
        case min
        case count
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "sum": self = .sum
            case "max": self = .max
            case "average": self = .average
            case "min": self = .min
            case "count": self = .count
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .sum: return "sum"
            case .max: return "max"
            case .average: return "average"
            case .min: return "min"
            case .count: return "count"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Statistic] = [
            .sum,
            .max,
            .average,
            .min,
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

    public enum Unit: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case count
        case bytes
        case percent
        case days
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "count": self = .count
            case "bytes": self = .bytes
            case "percent": self = .percent
            case "days": self = .days
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .count: return "count"
            case .bytes: return "bytes"
            case .percent: return "percent"
            case .days: return "days"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Unit] = [
            .count,
            .bytes,
            .percent,
            .days,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Comparison: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case atMost
        case atLeast
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "atMost": self = .atMost
            case "atLeast": self = .atLeast
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .atMost: return "atMost"
            case .atLeast: return "atLeast"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Comparison] = [
            .atMost,
            .atLeast,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Provider metric name.
    public var metric: String
    public var label: String
    public var statistic: Statistic
    /// The aggregate over the whole lookback window; null when the provider had
    /// no data.
    public var value: Double?
    public var unit: Unit
    /// The bound this reading was judged against, when it was a deciding reading.
    public var threshold: Double?
    /// `atMost`: the value at or under the threshold is the idle side.
    public var comparison: Comparison?

    public init(
        metric: String,
        label: String,
        statistic: Statistic,
        value: Double? = nil,
        unit: Unit,
        threshold: Double? = nil,
        comparison: Comparison? = nil
    ) {
        self.metric = metric
        self.label = label
        self.statistic = statistic
        self.value = value
        self.unit = unit
        self.threshold = threshold
        self.comparison = comparison
    }
}
