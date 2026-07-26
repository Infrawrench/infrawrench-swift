/*
 * InfrawrenchSDK v0.1.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.1.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A permission string. Roles may grant exact permissions like the entries in
/// this enum, or wildcards (e.g. `resources:*:read`, `*`).
public enum Permission: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case accountsRead
    case accountsWrite
    case accountsDelete
    case resourcesRead
    case resourcesWrite
    case resourcesDelete
    case resourcesExecute
    case secretsRead
    case secretsWrite
    case storageRead
    case storageWrite
    case dashboardsRead
    case dashboardsWrite
    case costsRead
    case budgetsRead
    case budgetsWrite
    case auditRead
    case teamRead
    case teamInvite
    case teamRoleWrite
    case teamRemove
    case apikeysRead
    case apikeysWrite
    case billingRead
    case billingWrite
    case sshKeysRead
    case sshKeysWrite
    case bastionsRead
    case bastionsWrite
    case chatRead
    case chatWrite
    case orgSettingsWrite
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "accounts:read": self = .accountsRead
        case "accounts:write": self = .accountsWrite
        case "accounts:delete": self = .accountsDelete
        case "resources:read": self = .resourcesRead
        case "resources:write": self = .resourcesWrite
        case "resources:delete": self = .resourcesDelete
        case "resources:execute": self = .resourcesExecute
        case "secrets:read": self = .secretsRead
        case "secrets:write": self = .secretsWrite
        case "storage:read": self = .storageRead
        case "storage:write": self = .storageWrite
        case "dashboards:read": self = .dashboardsRead
        case "dashboards:write": self = .dashboardsWrite
        case "costs:read": self = .costsRead
        case "budgets:read": self = .budgetsRead
        case "budgets:write": self = .budgetsWrite
        case "audit:read": self = .auditRead
        case "team:read": self = .teamRead
        case "team:invite": self = .teamInvite
        case "team:role:write": self = .teamRoleWrite
        case "team:remove": self = .teamRemove
        case "apikeys:read": self = .apikeysRead
        case "apikeys:write": self = .apikeysWrite
        case "billing:read": self = .billingRead
        case "billing:write": self = .billingWrite
        case "ssh-keys:read": self = .sshKeysRead
        case "ssh-keys:write": self = .sshKeysWrite
        case "bastions:read": self = .bastionsRead
        case "bastions:write": self = .bastionsWrite
        case "chat:read": self = .chatRead
        case "chat:write": self = .chatWrite
        case "org:settings:write": self = .orgSettingsWrite
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .accountsRead: return "accounts:read"
        case .accountsWrite: return "accounts:write"
        case .accountsDelete: return "accounts:delete"
        case .resourcesRead: return "resources:read"
        case .resourcesWrite: return "resources:write"
        case .resourcesDelete: return "resources:delete"
        case .resourcesExecute: return "resources:execute"
        case .secretsRead: return "secrets:read"
        case .secretsWrite: return "secrets:write"
        case .storageRead: return "storage:read"
        case .storageWrite: return "storage:write"
        case .dashboardsRead: return "dashboards:read"
        case .dashboardsWrite: return "dashboards:write"
        case .costsRead: return "costs:read"
        case .budgetsRead: return "budgets:read"
        case .budgetsWrite: return "budgets:write"
        case .auditRead: return "audit:read"
        case .teamRead: return "team:read"
        case .teamInvite: return "team:invite"
        case .teamRoleWrite: return "team:role:write"
        case .teamRemove: return "team:remove"
        case .apikeysRead: return "apikeys:read"
        case .apikeysWrite: return "apikeys:write"
        case .billingRead: return "billing:read"
        case .billingWrite: return "billing:write"
        case .sshKeysRead: return "ssh-keys:read"
        case .sshKeysWrite: return "ssh-keys:write"
        case .bastionsRead: return "bastions:read"
        case .bastionsWrite: return "bastions:write"
        case .chatRead: return "chat:read"
        case .chatWrite: return "chat:write"
        case .orgSettingsWrite: return "org:settings:write"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [Permission] = [
        .accountsRead,
        .accountsWrite,
        .accountsDelete,
        .resourcesRead,
        .resourcesWrite,
        .resourcesDelete,
        .resourcesExecute,
        .secretsRead,
        .secretsWrite,
        .storageRead,
        .storageWrite,
        .dashboardsRead,
        .dashboardsWrite,
        .costsRead,
        .budgetsRead,
        .budgetsWrite,
        .auditRead,
        .teamRead,
        .teamInvite,
        .teamRoleWrite,
        .teamRemove,
        .apikeysRead,
        .apikeysWrite,
        .billingRead,
        .billingWrite,
        .sshKeysRead,
        .sshKeysWrite,
        .bastionsRead,
        .bastionsWrite,
        .chatRead,
        .chatWrite,
        .orgSettingsWrite,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
