/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BackupCoverageRow: Codable, Hashable, Sendable {
    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case protected
        case automated
        case stale
        case unknown
        case unprotected
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "protected": self = .protected
            case "automated": self = .automated
            case "stale": self = .stale
            case "unknown": self = .unknown
            case "unprotected": self = .unprotected
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .protected: return "protected"
            case .automated: return "automated"
            case .stale: return "stale"
            case .unknown: return "unknown"
            case .unprotected: return "unprotected"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .protected,
            .automated,
            .stale,
            .unknown,
            .unprotected,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var resourceId: String
    public var pluginId: PluginId
    public var pluginName: String
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var accountId: String
    public var accountName: String
    public var displayName: String
    public var externalId: String?
    /// How the resource reads at a glance. `automated` means the provider is
    /// taking backups we cannot enumerate, so there is a restore point but no
    /// listable one. `unknown` means the resource type declares a provider-native
    /// automated-backup signal but this instance's value could not be read — it
    /// is unassessed, not a confirmed gap, and never produces a finding.
    public var state: State
    /// Backups in the inventory that protect this resource.
    public var backupCount: Int
    public var latestBackupId: String?
    public var latestBackupName: String?
    public var latestBackupAt: String?
    public var rpoHours: Double?
    /// Whether provider-native automated backups are on. Null means the plugin
    /// syncs no signal either way — which never counts as protection and never
    /// counts as a fault.
    public var automatedBackups: Bool?
    public var retentionDays: Double?
    /// The policy supplying `maxRpoHours` — the strictest RPO among those
    /// selecting this resource. Tracked separately from the retention policy
    /// because the two strictest demands routinely come from different policies.
    public var rpoPolicyId: String?
    public var rpoPolicyName: String?
    /// The policy supplying `minRetentionDays`.
    public var retentionPolicyId: String?
    public var retentionPolicyName: String?
    public var maxRpoHours: Int?
    public var minRetentionDays: Int?

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
        state: State,
        backupCount: Int,
        latestBackupId: String? = nil,
        latestBackupName: String? = nil,
        latestBackupAt: String? = nil,
        rpoHours: Double? = nil,
        automatedBackups: Bool? = nil,
        retentionDays: Double? = nil,
        rpoPolicyId: String? = nil,
        rpoPolicyName: String? = nil,
        retentionPolicyId: String? = nil,
        retentionPolicyName: String? = nil,
        maxRpoHours: Int? = nil,
        minRetentionDays: Int? = nil
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
        self.state = state
        self.backupCount = backupCount
        self.latestBackupId = latestBackupId
        self.latestBackupName = latestBackupName
        self.latestBackupAt = latestBackupAt
        self.rpoHours = rpoHours
        self.automatedBackups = automatedBackups
        self.retentionDays = retentionDays
        self.rpoPolicyId = rpoPolicyId
        self.rpoPolicyName = rpoPolicyName
        self.retentionPolicyId = retentionPolicyId
        self.retentionPolicyName = retentionPolicyName
        self.maxRpoHours = maxRpoHours
        self.minRetentionDays = minRetentionDays
    }
}
