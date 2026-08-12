/*
 * InfrawrenchSDK v1.17.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.17.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccessPrincipal: Codable, Hashable, Sendable {
    public enum Role2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case user
        case group
        case role
        case serviceAccount
        case key
        case binding
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "user": self = .user
            case "group": self = .group
            case "role": self = .role
            case "service-account": self = .serviceAccount
            case "key": self = .key
            case "binding": self = .binding
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .user: return "user"
            case .group: return "group"
            case .role: return "role"
            case .serviceAccount: return "service-account"
            case .key: return "key"
            case .binding: return "binding"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Role2] = [
            .user,
            .group,
            .role,
            .serviceAccount,
            .key,
            .binding,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Activity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case active
        case stale
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "active": self = .active
            case "stale": self = .stale
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .active: return "active"
            case .stale: return "stale"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Activity] = [
            .active,
            .stale,
            .unknown,
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
    /// What kind of identity the principal is, from the resource type's
    /// `principalRole` declaration. Grouping and labels only — it is not a
    /// permission model.
    public var role: Role2
    /// When the principal was last used, or null when the review has no evidence.
    public var lastUsedAt: String?
    public var daysSinceLastUsed: Int?
    /// What could be established about the principal's last use. `unknown` means
    /// the resource type declares no last-used field, or the provider stored
    /// nothing parseable — it is a first-class answer and is never reported as
    /// `stale`.
    public var activity: Activity
    public var createdAt: String?
    public var ageDays: Int?
    /// True when the type's declared admin indicator matched; null when the type
    /// declares none.
    public var admin: Bool?
    /// Multi-factor state, only on types that declare an MFA field. Null
    /// everywhere else — "not synced" is not "MFA is off".
    public var mfa: Bool?
    /// The principal this one hangs off — a key's owner, a binding's subject.
    public var parent: String?
    public var owner: AccessPrincipalOwner?
    /// The plugin action that revokes this principal, when the type declares one.
    /// Dispatch it through POST /resources/invoke-action; null means the provider
    /// offers no revocation Infrawrench can invoke.
    public var revokeActionId: String?

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
        role: Role2,
        lastUsedAt: String? = nil,
        daysSinceLastUsed: Int? = nil,
        activity: Activity,
        createdAt: String? = nil,
        ageDays: Int? = nil,
        admin: Bool? = nil,
        mfa: Bool? = nil,
        parent: String? = nil,
        owner: AccessPrincipalOwner? = nil,
        revokeActionId: String? = nil
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
        self.role = role
        self.lastUsedAt = lastUsedAt
        self.daysSinceLastUsed = daysSinceLastUsed
        self.activity = activity
        self.createdAt = createdAt
        self.ageDays = ageDays
        self.admin = admin
        self.mfa = mfa
        self.parent = parent
        self.owner = owner
        self.revokeActionId = revokeActionId
    }
}
