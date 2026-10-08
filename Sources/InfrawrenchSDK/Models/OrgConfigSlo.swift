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

public struct OrgConfigSlo: Codable, Hashable, Sendable {
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

    public struct Resource2: Codable, Hashable, Sendable {
        public var pluginId: String
        public var resourceTypeId: String
        public var externalId: String
        /// Account display name.
        public var account: String

        public init(
            pluginId: String,
            resourceTypeId: String,
            externalId: String,
            account: String
        ) {
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.externalId = externalId
            self.account = account
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

    /// Stable slug identifying this entity across organizations. Derived from the
    /// name on export; it is what an apply matches on, so renaming an entity
    /// while keeping its key is a rename rather than a delete-and-create.
    public var key: String
    public var name: String
    public var description: String?
    public var sliKind: SliKind
    /// `probe_*`: key of a probe in this document's `probes` or the
    /// organization's.
    public var probeKey: String?
    public var latencyThresholdMs: Int?
    /// `metric_threshold`: the resource, resolved against the organization's
    /// inventory on apply.
    public var resource: Resource2?
    public var metricKey: String?
    public var comparator: Comparator?
    public var threshold: Double?
    public var targetPercent: Double
    public var windowDays: Double?
    public var alertsEnabled: Bool?
    public var suggestFreeze: Bool?
    public var enabled: Bool?

    public init(
        key: String,
        name: String,
        description: String? = nil,
        sliKind: SliKind,
        probeKey: String? = nil,
        latencyThresholdMs: Int? = nil,
        resource: Resource2? = nil,
        metricKey: String? = nil,
        comparator: Comparator? = nil,
        threshold: Double? = nil,
        targetPercent: Double,
        windowDays: Double? = nil,
        alertsEnabled: Bool? = nil,
        suggestFreeze: Bool? = nil,
        enabled: Bool? = nil
    ) {
        self.key = key
        self.name = name
        self.description = description
        self.sliKind = sliKind
        self.probeKey = probeKey
        self.latencyThresholdMs = latencyThresholdMs
        self.resource = resource
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
