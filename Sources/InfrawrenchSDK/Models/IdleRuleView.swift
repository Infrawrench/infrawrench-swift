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

public struct IdleRuleView: Codable, Hashable, Sendable {
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

    public var ruleKey: String
    public var pluginId: PluginId
    public var pluginName: String
    public var ruleId: String
    public var label: String
    public var description: String
    public var action: Action
    public var resourceTypeNames: [String]
    public var enabled: Bool
    public var thresholds: [IdleRuleThresholdView]

    public init(
        ruleKey: String,
        pluginId: PluginId,
        pluginName: String,
        ruleId: String,
        label: String,
        description: String,
        action: Action,
        resourceTypeNames: [String],
        enabled: Bool,
        thresholds: [IdleRuleThresholdView]
    ) {
        self.ruleKey = ruleKey
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.ruleId = ruleId
        self.label = label
        self.description = description
        self.action = action
        self.resourceTypeNames = resourceTypeNames
        self.enabled = enabled
        self.thresholds = thresholds
    }
}
