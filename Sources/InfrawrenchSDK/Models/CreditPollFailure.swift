/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreditPollFailure: Codable, Hashable, Sendable {
    public var accountId: String
    public var accountName: String
    public var pluginId: PluginId
    public var error: String
    public var helpLabel: String?
    /// Set when the plugin reported a permission gap rather than an outage.
    public var helpUrl: String?
    public var failureCount: Int

    public init(
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        error: String,
        helpLabel: String? = nil,
        helpUrl: String? = nil,
        failureCount: Int
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.error = error
        self.helpLabel = helpLabel
        self.helpUrl = helpUrl
        self.failureCount = failureCount
    }
}
