/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct HygieneFinding: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case apiKeyNeverUsed
        case apiKeyIdle
        case apiKeyExpiredNotRevoked
        case apiKeyWildcardScope
        case apiKeyUnusedScopes
        case sshKeyNeverUsed
        case sshKeyIdle
        case memberUnusedPermissions
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "api_key_never_used": self = .apiKeyNeverUsed
            case "api_key_idle": self = .apiKeyIdle
            case "api_key_expired_not_revoked": self = .apiKeyExpiredNotRevoked
            case "api_key_wildcard_scope": self = .apiKeyWildcardScope
            case "api_key_unused_scopes": self = .apiKeyUnusedScopes
            case "ssh_key_never_used": self = .sshKeyNeverUsed
            case "ssh_key_idle": self = .sshKeyIdle
            case "member_unused_permissions": self = .memberUnusedPermissions
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .apiKeyNeverUsed: return "api_key_never_used"
            case .apiKeyIdle: return "api_key_idle"
            case .apiKeyExpiredNotRevoked: return "api_key_expired_not_revoked"
            case .apiKeyWildcardScope: return "api_key_wildcard_scope"
            case .apiKeyUnusedScopes: return "api_key_unused_scopes"
            case .sshKeyNeverUsed: return "ssh_key_never_used"
            case .sshKeyIdle: return "ssh_key_idle"
            case .memberUnusedPermissions: return "member_unused_permissions"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .apiKeyNeverUsed,
            .apiKeyIdle,
            .apiKeyExpiredNotRevoked,
            .apiKeyWildcardScope,
            .apiKeyUnusedScopes,
            .sshKeyNeverUsed,
            .sshKeyIdle,
            .memberUnusedPermissions,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case high
        case medium
        case low
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "high": self = .high
            case "medium": self = .medium
            case "low": self = .low
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .high: return "high"
            case .medium: return "medium"
            case .low: return "low"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Severity] = [
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

    public enum EntityType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case apiKey
        case sshKey
        case member
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "api-key": self = .apiKey
            case "ssh-key": self = .sshKey
            case "member": self = .member
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .apiKey: return "api-key"
            case .sshKey: return "ssh-key"
            case .member: return "member"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [EntityType] = [
            .apiKey,
            .sshKey,
            .member,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum FactsValue: Codable, Hashable, Sendable {
        case string(String)
        case double(Double)
        case bool(Bool)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
                return
            }
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            if let value = try? container.decode(Bool.self) {
                self = .bool(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .double(let value): try container.encode(value)
            case .bool(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    /// Stable across runs, so a client can remember what has been reviewed.
    public var id: String
    public var kind: Kind
    public var severity: Severity
    public var title: String
    /// The evidence behind the finding.
    public var detail: String
    public var recommendation: String
    public var entityType: EntityType
    public var entityId: String
    public var entityName: String
    /// Structured detail for table columns and reports.
    public var facts: [String: FactsValue?]

    public init(
        id: String,
        kind: Kind,
        severity: Severity,
        title: String,
        detail: String,
        recommendation: String,
        entityType: EntityType,
        entityId: String,
        entityName: String,
        facts: [String: FactsValue?]
    ) {
        self.id = id
        self.kind = kind
        self.severity = severity
        self.title = title
        self.detail = detail
        self.recommendation = recommendation
        self.entityType = entityType
        self.entityId = entityId
        self.entityName = entityName
        self.facts = facts
    }
}
