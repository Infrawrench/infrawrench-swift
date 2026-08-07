/*
 * InfrawrenchSDK v0.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MetricAlertRuleWithStatus: Codable, Hashable, Sendable {
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

    public var name: String
    /// Selector: plugin the resource must belong to. Null matches any plugin.
    public var pluginId: String?
    /// Selector: resource type within the plugin. Null matches any type.
    public var resourceTypeId: String?
    /// Selector: tag key the resource must carry (matched case-insensitively).
    /// Null applies no tag filter. Resources are always selected by this query,
    /// never by id, so rules cover resources created later.
    public var tagKey: String?
    /// Selector: exact value tagKey must have. Null matches any value.
    public var tagValue: String?
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
    public var id: String
    public var lastEvalAt: String?
    public var createdAt: String
    public var updatedAt: String
    /// Resources currently in breach of this rule.
    public var firingCount: Int
    /// Resources the selector matches right now.
    public var matchingResourceCount: Int

    public init(
        name: String,
        pluginId: String? = nil,
        resourceTypeId: String? = nil,
        tagKey: String? = nil,
        tagValue: String? = nil,
        metricKey: String,
        comparator: Comparator,
        threshold: Double,
        forMinutes: Int,
        cooldownMinutes: Int,
        enabled: Bool,
        id: String,
        lastEvalAt: String? = nil,
        createdAt: String,
        updatedAt: String,
        firingCount: Int,
        matchingResourceCount: Int
    ) {
        self.name = name
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.tagKey = tagKey
        self.tagValue = tagValue
        self.metricKey = metricKey
        self.comparator = comparator
        self.threshold = threshold
        self.forMinutes = forMinutes
        self.cooldownMinutes = cooldownMinutes
        self.enabled = enabled
        self.id = id
        self.lastEvalAt = lastEvalAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.firingCount = firingCount
        self.matchingResourceCount = matchingResourceCount
    }
}
