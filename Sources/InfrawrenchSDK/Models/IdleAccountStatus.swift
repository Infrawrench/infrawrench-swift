/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IdleAccountStatus: Codable, Hashable, Sendable {
    public var accountId: String
    public var accountName: String
    public var pluginId: PluginId
    public var pluginName: String
    public var lastPolledAt: String?
    public var nextPollAt: String?
    /// Last collection failure; null after a success.
    public var lastError: String?
    public var helpLabel: String?
    /// https link to the fix for a permission gap.
    public var helpUrl: String?
    public var findingCount: Int

    public init(
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        pluginName: String,
        lastPolledAt: String? = nil,
        nextPollAt: String? = nil,
        lastError: String? = nil,
        helpLabel: String? = nil,
        helpUrl: String? = nil,
        findingCount: Int
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.lastPolledAt = lastPolledAt
        self.nextPollAt = nextPollAt
        self.lastError = lastError
        self.helpLabel = helpLabel
        self.helpUrl = helpUrl
        self.findingCount = findingCount
    }
}
