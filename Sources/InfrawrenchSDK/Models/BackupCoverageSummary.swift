/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BackupCoverageSummary: Codable, Hashable, Sendable {
    /// Stateful resources the plugin declarations can judge.
    public var statefulCount: Int
    public var protectedCount: Int
    /// Confirmed gaps. Excludes unassessed resources; this is what the digest
    /// counts.
    public var unprotectedCount: Int
    /// Resources that could not be assessed: the type declares a provider-native
    /// automated-backup signal but this instance's value was absent or
    /// unrecognised. Reported separately so 'we found no gap' and 'we could not
    /// tell' do not read alike.
    public var unknownCount: Int
    public var backupCount: Int
    public var orphanedBackupCount: Int
    /// Backups whose source could not be determined — the plugin syncs no source
    /// field, the field was empty, or more than one resource answered to it.
    /// Reported rather than hidden: 'we found no orphans' and 'we could not tell'
    /// are different answers.
    public var unattributableBackupCount: Int
    public var orphanedGb: Double?
    /// Null when billing data is unavailable or the orphans span several
    /// currencies.
    public var orphanedMonthlyCost: Double?
    public var currency: String?
    /// Largest RPO across resources that have a datable backup at all.
    public var worstRpoHours: Double?

    public init(
        statefulCount: Int,
        protectedCount: Int,
        unprotectedCount: Int,
        unknownCount: Int,
        backupCount: Int,
        orphanedBackupCount: Int,
        unattributableBackupCount: Int,
        orphanedGb: Double? = nil,
        orphanedMonthlyCost: Double? = nil,
        currency: String? = nil,
        worstRpoHours: Double? = nil
    ) {
        self.statefulCount = statefulCount
        self.protectedCount = protectedCount
        self.unprotectedCount = unprotectedCount
        self.unknownCount = unknownCount
        self.backupCount = backupCount
        self.orphanedBackupCount = orphanedBackupCount
        self.unattributableBackupCount = unattributableBackupCount
        self.orphanedGb = orphanedGb
        self.orphanedMonthlyCost = orphanedMonthlyCost
        self.currency = currency
        self.worstRpoHours = worstRpoHours
    }
}
