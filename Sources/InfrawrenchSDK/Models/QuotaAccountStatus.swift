/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct QuotaAccountStatus: Codable, Hashable, Sendable {
    public var accountId: String
    public var accountName: String
    public var pluginId: PluginId
    /// Quota rows currently stored for this account.
    public var quotaCount: Int
    /// Last successful collection; null if never.
    public var lastPolledAt: String?
    /// Last collection failure, or null when the last pass succeeded.
    public var lastError: String?
    public var lastErrorHelpLabel: String?
    /// Set when the failure was a fixable permission gap rather than an outage.
    public var lastErrorHelpUrl: String?
    /// The plugin reports a representative subset of the provider's quotas, not
    /// all of them. True for AWS and DigitalOcean.
    public var partial: Bool

    public init(
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        quotaCount: Int,
        lastPolledAt: String? = nil,
        lastError: String? = nil,
        lastErrorHelpLabel: String? = nil,
        lastErrorHelpUrl: String? = nil,
        partial: Bool
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.quotaCount = quotaCount
        self.lastPolledAt = lastPolledAt
        self.lastError = lastError
        self.lastErrorHelpLabel = lastErrorHelpLabel
        self.lastErrorHelpUrl = lastErrorHelpUrl
        self.partial = partial
    }
}
