/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Set only when classification is "dangling".
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct DnsTargetService: Codable, Hashable, Sendable {
    public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case critical
        case high
        case medium
        case low
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "critical": self = .critical
            case "high": self = .high
            case "medium": self = .medium
            case "low": self = .low
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .critical: return "critical"
            case .high: return "high"
            case .medium: return "medium"
            case .low: return "low"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Severity] = [
            .critical,
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

    public var pluginId: PluginId
    public var pluginName: String
    public var resourceTypeId: String
    public var ruleId: String
    public var label: String
    public var severity: Severity
    /// Plugin-authored note on what claiming the name gets an attacker.
    public var reason: String
    /// The instance-identifying part of the hostname, e.g. the bucket or app
    /// name.
    public var claimLabel: String

    public init(
        pluginId: PluginId,
        pluginName: String,
        resourceTypeId: String,
        ruleId: String,
        label: String,
        severity: Severity,
        reason: String,
        claimLabel: String
    ) {
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.resourceTypeId = resourceTypeId
        self.ruleId = ruleId
        self.label = label
        self.severity = severity
        self.reason = reason
        self.claimLabel = claimLabel
    }
}
