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

public struct CommitmentPollFailure: Codable, Hashable, Sendable {
    public var accountId: String
    public var accountName: String
    public var pluginId: PluginId
    public var message: String
    public var failureCount: Int

    public init(
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        message: String,
        failureCount: Int
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.message = message
        self.failureCount = failureCount
    }
}
