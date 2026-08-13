/*
 * InfrawrenchSDK v1.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BackupFinding: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case unprotected
        case rpoBreach
        case retentionBelowPolicy
        case orphanedSnapshot
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "unprotected": self = .unprotected
            case "rpo-breach": self = .rpoBreach
            case "retention-below-policy": self = .retentionBelowPolicy
            case "orphaned-snapshot": self = .orphanedSnapshot
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .unprotected: return "unprotected"
            case .rpoBreach: return "rpo-breach"
            case .retentionBelowPolicy: return "retention-below-policy"
            case .orphanedSnapshot: return "orphaned-snapshot"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .unprotected,
            .rpoBreach,
            .retentionBelowPolicy,
            .orphanedSnapshot,
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

    /// Infrawrench resource id the finding is on.
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
    /// What the finding describes: nothing protects the resource; the newest
    /// backup is older than the policy's RPO; the provider-native retention
    /// window is shorter than the policy asks; or a backup whose source resource
    /// no longer exists.
    public var kind: Kind
    /// How bad the gap is. Orphaned backups are always `low` — they cost money,
    /// not data.
    public var severity: Severity
    public var title: String
    /// Sentence explaining the gap and what would close it.
    public var detail: String
    /// The policy supplying the objective this finding breaches — the RPO policy
    /// for `rpo-breach`, the retention policy for `retention-below-policy`. Null
    /// when no policy applies.
    public var policyId: String?
    public var policyName: String?
    /// Hours since the newest backup protecting the resource; null when there is
    /// none.
    public var rpoHours: Double?
    /// The policy's allowance, when one applied.
    public var maxRpoHours: Int?
    /// Provider-native retention window in days, when the plugin syncs one.
    public var retentionDays: Double?
    public var minRetentionDays: Int?
    public var latestBackupId: String?
    public var latestBackupName: String?
    public var latestBackupAt: String?
    /// Size of an orphaned backup in GiB, when the plugin syncs one.
    public var sizeGb: Double?
    /// Trailing-30-day spend on an orphaned backup. Null means the cost could not
    /// be determined — never that the backup is free.
    public var monthlyCost: Double?
    public var currency: String?

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
        kind: Kind,
        severity: Severity,
        title: String,
        detail: String,
        policyId: String? = nil,
        policyName: String? = nil,
        rpoHours: Double? = nil,
        maxRpoHours: Int? = nil,
        retentionDays: Double? = nil,
        minRetentionDays: Int? = nil,
        latestBackupId: String? = nil,
        latestBackupName: String? = nil,
        latestBackupAt: String? = nil,
        sizeGb: Double? = nil,
        monthlyCost: Double? = nil,
        currency: String? = nil
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
        self.kind = kind
        self.severity = severity
        self.title = title
        self.detail = detail
        self.policyId = policyId
        self.policyName = policyName
        self.rpoHours = rpoHours
        self.maxRpoHours = maxRpoHours
        self.retentionDays = retentionDays
        self.minRetentionDays = minRetentionDays
        self.latestBackupId = latestBackupId
        self.latestBackupName = latestBackupName
        self.latestBackupAt = latestBackupAt
        self.sizeGb = sizeGb
        self.monthlyCost = monthlyCost
        self.currency = currency
    }
}
