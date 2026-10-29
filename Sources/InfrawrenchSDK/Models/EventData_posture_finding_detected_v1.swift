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

/// `data` of a `posture.finding.detected` event, version 1. A critical or high
/// severity posture check started failing on a resource. Each finding is sent
/// once.
public struct EventData_posture_finding_detected_v1: Codable, Hashable, Sendable {
    public enum FindingSeverity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case critical
        case high
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "critical": self = .critical
            case "high": self = .high
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .critical: return "critical"
            case .high: return "high"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [FindingSeverity] = [
            .critical,
            .high,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Infrawrench resource id.
    public var resourceId: String
    /// Resource display name.
    public var resourceName: String
    /// Resource type id.
    public var resourceTypeId: String
    /// Provider plugin id.
    public var pluginId: String
    /// Provider-native id.
    public var externalId: String?
    /// The posture rule that matched.
    public var ruleId: String
    /// Short rule title.
    public var title: String
    /// The finding's own severity.
    public var findingSeverity: FindingSeverity
    /// Posture category.
    public var category: String
    /// Why the resource fails the rule.
    public var reason: String

    public init(
        resourceId: String,
        resourceName: String,
        resourceTypeId: String,
        pluginId: String,
        externalId: String? = nil,
        ruleId: String,
        title: String,
        findingSeverity: FindingSeverity,
        category: String,
        reason: String
    ) {
        self.resourceId = resourceId
        self.resourceName = resourceName
        self.resourceTypeId = resourceTypeId
        self.pluginId = pluginId
        self.externalId = externalId
        self.ruleId = ruleId
        self.title = title
        self.findingSeverity = findingSeverity
        self.category = category
        self.reason = reason
    }
}
