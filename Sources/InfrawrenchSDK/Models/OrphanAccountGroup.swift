/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrphanAccountGroup: Codable, Hashable, Sendable {
    public var accountId: String
    public var accountName: String
    public var pluginId: PluginId
    public var pluginName: String
    public var resources: [OrphanedResource]

    public init(
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        pluginName: String,
        resources: [OrphanedResource]
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.resources = resources
    }
}
