/*
 * InfrawrenchSDK v1.1.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.1.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LogCapableResource: Codable, Hashable, Sendable {
    public var resourceId: String
    public var accountId: String
    public var accountName: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var displayName: String
    /// Set for sidecar streams: the stored parent resource the peer client is
    /// built through.
    public var parentResourceId: String?
    public var parentDisplayName: String?

    public init(
        resourceId: String,
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        resourceTypeId: String,
        displayName: String,
        parentResourceId: String? = nil,
        parentDisplayName: String? = nil
    ) {
        self.resourceId = resourceId
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.displayName = displayName
        self.parentResourceId = parentResourceId
        self.parentDisplayName = parentDisplayName
    }
}
