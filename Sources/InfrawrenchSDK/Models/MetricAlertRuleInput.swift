/*
 * InfrawrenchSDK v1.100.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.100.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MetricAlertRuleInput: Codable, Hashable, Sendable {
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
            case ">": self = .value1
            case ">=": self = .value2
            case "<": self = .value3
            case "<=": self = .value4
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .value1: return ">"
            case .value2: return ">="
            case .value3: return "<"
            case .value4: return "<="
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

    public var pluginId: JSONValue
    public var resourceTypeId: JSONValue
    public var tagKey: JSONValue
    public var tagValue: JSONValue
    public var name: String
    /// The metric series label as the resource's charts report it (see
    /// /metric-alerts/metric-keys).
    public var metricKey: String
    public var comparator: Comparator
    public var threshold: Double
    /// Trailing window (minutes) the condition must hold for before firing.
    public var forMinutes: Int
    /// Least minutes between notified firings for one (rule, resource).
    public var cooldownMinutes: Int
    public var enabled: Bool

    public init(
        pluginId: JSONValue,
        resourceTypeId: JSONValue,
        tagKey: JSONValue,
        tagValue: JSONValue,
        name: String,
        metricKey: String,
        comparator: Comparator,
        threshold: Double,
        forMinutes: Int,
        cooldownMinutes: Int,
        enabled: Bool
    ) {
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.tagKey = tagKey
        self.tagValue = tagValue
        self.name = name
        self.metricKey = metricKey
        self.comparator = comparator
        self.threshold = threshold
        self.forMinutes = forMinutes
        self.cooldownMinutes = cooldownMinutes
        self.enabled = enabled
    }
}
