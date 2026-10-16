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

/// `data` of a `dora.band_changed` event, version 1. One of the four DORA metrics
/// for production moved to a different performance band over the trailing 30
/// days. Checked once a day.
public struct EventData_dora_band_changed_v1: Codable, Hashable, Sendable {
    public enum Metric: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case deploymentFrequency
        case leadTime
        case changeFailureRate
        case timeToRestore
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "deployment_frequency": self = .deploymentFrequency
            case "lead_time": self = .leadTime
            case "change_failure_rate": self = .changeFailureRate
            case "time_to_restore": self = .timeToRestore
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .deploymentFrequency: return "deployment_frequency"
            case .leadTime: return "lead_time"
            case .changeFailureRate: return "change_failure_rate"
            case .timeToRestore: return "time_to_restore"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Metric] = [
            .deploymentFrequency,
            .leadTime,
            .changeFailureRate,
            .timeToRestore,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum PreviousBand: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case elite
        case high
        case medium
        case low
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "elite": self = .elite
            case "high": self = .high
            case "medium": self = .medium
            case "low": self = .low
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .elite: return "elite"
            case .high: return "high"
            case .medium: return "medium"
            case .low: return "low"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PreviousBand] = [
            .elite,
            .high,
            .medium,
            .low,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Band: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case elite
        case high
        case medium
        case low
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "elite": self = .elite
            case "high": self = .high
            case "medium": self = .medium
            case "low": self = .low
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .elite: return "elite"
            case .high: return "high"
            case .medium: return "medium"
            case .low: return "low"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Band] = [
            .elite,
            .high,
            .medium,
            .low,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Direction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case improved
        case worsened
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "improved": self = .improved
            case "worsened": self = .worsened
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .improved: return "improved"
            case .worsened: return "worsened"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Direction] = [
            .improved,
            .worsened,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The metric.
    public var metric: Metric
    /// Band over the 30 days ending the day before.
    public var previousBand: PreviousBand
    /// Band over the 30 days ending `windowEnd`.
    public var band: Band
    /// Whether performance got better or worse.
    public var direction: Direction
    /// The metric now: deploys per day, median hours, or a 0-1 failure fraction.
    public var value: Double
    /// The metric over the window ending the day before.
    public var previousValue: Double
    /// Observations the current value rests on.
    public var sample: Int
    /// First day of the current window (YYYY-MM-DD, UTC).
    public var windowStart: String
    /// Last day of the current window (YYYY-MM-DD, UTC).
    public var windowEnd: String

    public init(
        metric: Metric,
        previousBand: PreviousBand,
        band: Band,
        direction: Direction,
        value: Double,
        previousValue: Double,
        sample: Int,
        windowStart: String,
        windowEnd: String
    ) {
        self.metric = metric
        self.previousBand = previousBand
        self.band = band
        self.direction = direction
        self.value = value
        self.previousValue = previousValue
        self.sample = sample
        self.windowStart = windowStart
        self.windowEnd = windowEnd
    }
}
