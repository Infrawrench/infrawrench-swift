/*
 * InfrawrenchSDK v0.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExpiryItem: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case tlsCert
        case domain
        case apiToken
        case accessKey
        case k8sCert
        case sshKey
        case secretVersion
        case other
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "tls-cert": self = .tlsCert
            case "domain": self = .domain
            case "api-token": self = .apiToken
            case "access-key": self = .accessKey
            case "k8s-cert": self = .k8sCert
            case "ssh-key": self = .sshKey
            case "secret-version": self = .secretVersion
            case "other": self = .other
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .tlsCert: return "tls-cert"
            case .domain: return "domain"
            case .apiToken: return "api-token"
            case .accessKey: return "access-key"
            case .k8sCert: return "k8s-cert"
            case .sshKey: return "ssh-key"
            case .secretVersion: return "secret-version"
            case .other: return "other"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .tlsCert,
            .domain,
            .apiToken,
            .accessKey,
            .k8sCert,
            .sshKey,
            .secretVersion,
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

    public enum Basis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case expiry
        case age
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "expiry": self = .expiry
            case "age": self = .age
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .expiry: return "expiry"
            case .age: return "age"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Basis] = [
            .expiry,
            .age,
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
        case expired
        case critical
        case warning
        case upcoming
        case ok
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "expired": self = .expired
            case "critical": self = .critical
            case "warning": self = .warning
            case "upcoming": self = .upcoming
            case "ok": self = .ok
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .expired: return "expired"
            case .critical: return "critical"
            case .warning: return "warning"
            case .upcoming: return "upcoming"
            case .ok: return "ok"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Severity] = [
            .expired,
            .critical,
            .warning,
            .upcoming,
            .ok,
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
    /// The declared field the deadline came from.
    public var fieldKey: String
    /// Grouping bucket for the kind of deadline.
    public var kind: Kind
    /// Plugin-authored caption for the deadline.
    public var label: String
    /// `expiry` — the field held the deadline itself; `age` — the deadline was
    /// derived from a creation/rotation date plus an age budget.
    public var basis: Basis
    /// The deadline.
    public var dueAt: String
    /// Whole days until dueAt (floor); negative once expired.
    public var daysRemaining: Int
    /// How close the deadline is: `expired` (in the past), `critical` (due within
    /// 7 days), `warning` (within 30 days), `upcoming` (within the organization's
    /// lead time), or `ok` (tracked, but further out than the lead time).
    public var severity: Severity

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
        fieldKey: String,
        kind: Kind,
        label: String,
        basis: Basis,
        dueAt: String,
        daysRemaining: Int,
        severity: Severity
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
        self.fieldKey = fieldKey
        self.kind = kind
        self.label = label
        self.basis = basis
        self.dueAt = dueAt
        self.daysRemaining = daysRemaining
        self.severity = severity
    }
}
