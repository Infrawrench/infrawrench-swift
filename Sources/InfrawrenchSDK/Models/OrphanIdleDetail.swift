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

/// Present when a metric-based idle rule flagged the row rather than the type's
/// orphan rule: the rule, the metric evidence and the lookback window.
public struct OrphanIdleDetail: Codable, Hashable, Sendable {
    public enum Action: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case remove
        case reconfigure
        case stop
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "remove": self = .remove
            case "reconfigure": self = .reconfigure
            case "stop": self = .stop
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .remove: return "remove"
            case .reconfigure: return "reconfigure"
            case .stop: return "stop"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Action] = [
            .remove,
            .reconfigure,
            .stop,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var ruleId: String
    /// `pluginId:ruleId`, the key the settings use.
    public var ruleKey: String
    public var ruleLabel: String
    /// What acting on it means. Only `remove` findings are offered as a removal
    /// pull request.
    public var action: Action
    public var lookbackDays: Int
    public var evidence: [IdleMetricEvidence]
    /// First collection that flagged it.
    public var detectedAt: String
    /// Latest collection that confirmed it.
    public var evaluatedAt: String
    /// False when the subject is not a synced resource (a custom metric): `id` is
    /// then a finding id, not a resource id.
    public var hasResource: Bool

    public init(
        ruleId: String,
        ruleKey: String,
        ruleLabel: String,
        action: Action,
        lookbackDays: Int,
        evidence: [IdleMetricEvidence],
        detectedAt: String,
        evaluatedAt: String,
        hasResource: Bool
    ) {
        self.ruleId = ruleId
        self.ruleKey = ruleKey
        self.ruleLabel = ruleLabel
        self.action = action
        self.lookbackDays = lookbackDays
        self.evidence = evidence
        self.detectedAt = detectedAt
        self.evaluatedAt = evaluatedAt
        self.hasResource = hasResource
    }
}
