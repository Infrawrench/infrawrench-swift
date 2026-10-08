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

public struct SloCreate: Codable, Hashable, Sendable {
    public enum SliKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case probeAvailability
        case probeLatency
        case metricThreshold
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "probe_availability": self = .probeAvailability
            case "probe_latency": self = .probeLatency
            case "metric_threshold": self = .metricThreshold
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .probeAvailability: return "probe_availability"
            case .probeLatency: return "probe_latency"
            case .metricThreshold: return "metric_threshold"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [SliKind] = [
            .probeAvailability,
            .probeLatency,
            .metricThreshold,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Comparator: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case value1
        case value2
        case value3
        case value4
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "<": self = .value1
            case "<=": self = .value2
            case ">": self = .value3
            case ">=": self = .value4
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .value1: return "<"
            case .value2: return "<="
            case .value3: return ">"
            case .value4: return ">="
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Comparator] = [
            .value1,
            .value2,
            .value3,
            .value4,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Unique in the organization; at most 120 characters.
    public var name: String
    /// At most 500 characters.
    public var description: String?
    /// Where the SLI comes from: a synthetic probe's success ratio, the share of
    /// a probe's checks at or under a latency threshold, or the share of minutes
    /// a resource's metric series satisfies a comparison.
    public var sliKind: SliKind
    /// `probe_*`: the synthetic probe the SLI is read from.
    public var probeId: String?
    /// `probe_latency`: a check is good at or under this many ms (1-60000).
    public var latencyThresholdMs: Int?
    /// `metric_threshold`: the synced resource reporting the series.
    public var resourceId: String?
    /// `metric_threshold`: the series label as the resource reports it, e.g. "CPU
    /// %".
    public var metricKey: String?
    /// `metric_threshold` only: a minute is good when `value <comparator>
    /// threshold`.
    public var comparator: Comparator?
    /// `metric_threshold`: the comparison's right side.
    public var threshold: Double?
    /// Objective as a percentage, at least 50 and at most 99.999.
    public var targetPercent: Double?
    /// Rolling window in days.
    public var windowDays: Double?
    public var alertsEnabled: Bool?
    public var suggestFreeze: Bool?
    public var enabled: Bool?

    public init(
        name: String,
        description: String? = nil,
        sliKind: SliKind,
        probeId: String? = nil,
        latencyThresholdMs: Int? = nil,
        resourceId: String? = nil,
        metricKey: String? = nil,
        comparator: Comparator? = nil,
        threshold: Double? = nil,
        targetPercent: Double? = nil,
        windowDays: Double? = nil,
        alertsEnabled: Bool? = nil,
        suggestFreeze: Bool? = nil,
        enabled: Bool? = nil
    ) {
        self.name = name
        self.description = description
        self.sliKind = sliKind
        self.probeId = probeId
        self.latencyThresholdMs = latencyThresholdMs
        self.resourceId = resourceId
        self.metricKey = metricKey
        self.comparator = comparator
        self.threshold = threshold
        self.targetPercent = targetPercent
        self.windowDays = windowDays
        self.alertsEnabled = alertsEnabled
        self.suggestFreeze = suggestFreeze
        self.enabled = enabled
    }
}
