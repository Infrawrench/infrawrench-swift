/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PostureFinding: Codable, Hashable, Sendable {
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

    public enum Category: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case publicExposure
        case encryption
        case credentialAge
        case dataProtection
        case other
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "public-exposure": self = .publicExposure
            case "encryption": self = .encryption
            case "credential-age": self = .credentialAge
            case "data-protection": self = .dataProtection
            case "other": self = .other
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .publicExposure: return "public-exposure"
            case .encryption: return "encryption"
            case .credentialAge: return "credential-age"
            case .dataProtection: return "data-protection"
            case .other: return "other"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Category] = [
            .publicExposure,
            .encryption,
            .credentialAge,
            .dataProtection,
            .other,
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
    public var pluginId: PluginId
    public var pluginName: String
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var accountId: String
    public var accountName: String
    public var displayName: String
    /// Provider-native id, when known.
    public var externalId: String?
    /// The matched rule's stable id, unique within the plugin.
    public var ruleId: String
    /// Short rule title.
    public var title: String
    /// How bad the finding is. `critical` and `high` findings feed the posture
    /// alerts; `medium` and `low` are hygiene work surfaced on the posture screen
    /// only.
    public var severity: Severity
    /// Grouping bucket for what kind of exposure the finding describes.
    public var category: Category
    /// Plugin-authored explanation of why this is a finding.
    public var reason: String

    public init(
        resourceId: String,
        pluginId: PluginId,
        pluginName: String,
        resourceTypeId: String,
        resourceTypeName: String,
        accountId: String,
        accountName: String,
        displayName: String,
        externalId: String? = nil,
        ruleId: String,
        title: String,
        severity: Severity,
        category: Category,
        reason: String
    ) {
        self.resourceId = resourceId
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.accountId = accountId
        self.accountName = accountName
        self.displayName = displayName
        self.externalId = externalId
        self.ruleId = ruleId
        self.title = title
        self.severity = severity
        self.category = category
        self.reason = reason
    }
}
