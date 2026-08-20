/*
 * InfrawrenchSDK v1.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgConfigMetricAlert: Codable, Hashable, Sendable {
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

    /// Stable slug identifying this entity across organizations. Derived from the
    /// name on export; it is what an apply matches on, so renaming an entity
    /// while keeping its key is a rename rather than a delete-and-create.
    public var key: String
    public var name: String
    public var pluginId: String?
    public var resourceTypeId: String?
    public var tagKey: String?
    public var tagValue: String?
    public var metricKey: String
    public var comparator: Comparator
    public var threshold: Double
    public var forMinutes: Int?
    public var cooldownMinutes: Int?
    public var enabled: Bool?

    public init(
        key: String,
        name: String,
        pluginId: String? = nil,
        resourceTypeId: String? = nil,
        tagKey: String? = nil,
        tagValue: String? = nil,
        metricKey: String,
        comparator: Comparator,
        threshold: Double,
        forMinutes: Int? = nil,
        cooldownMinutes: Int? = nil,
        enabled: Bool? = nil
    ) {
        self.key = key
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
    }
}
