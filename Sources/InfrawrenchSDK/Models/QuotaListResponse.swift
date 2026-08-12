/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct QuotaListResponse: Codable, Hashable, Sendable {
    /// Every quota with a reading, worst first.
    public var rows: [QuotaRow]
    /// Per-account collection status for every account on a quota-capable plugin.
    /// Present even when the account has rows: an empty `rows` alone cannot
    /// distinguish 'nothing is near a limit' from 'every collection is failing'.
    public var accounts: [QuotaAccountStatus]
    /// The organization's alert threshold as a fraction, so the page's marker and
    /// the alert agree.
    public var threshold: Double
    /// Plugins the organization holds accounts with that cannot report quotas at
    /// all. Named rather than counted, because the absence is the finding.
    public var unsupportedPluginIds: [PluginId]

    public init(
        rows: [QuotaRow],
        accounts: [QuotaAccountStatus],
        threshold: Double,
        unsupportedPluginIds: [PluginId]
    ) {
        self.rows = rows
        self.accounts = accounts
        self.threshold = threshold
        self.unsupportedPluginIds = unsupportedPluginIds
    }
}
