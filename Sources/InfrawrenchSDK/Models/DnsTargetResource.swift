/*
 * InfrawrenchSDK v1.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Set only when classification is "owned".
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct DnsTargetResource: Codable, Hashable, Sendable {
    public var resourceId: String
    public var displayName: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var accountId: String

    public init(
        resourceId: String,
        displayName: String,
        pluginId: PluginId,
        resourceTypeId: String,
        resourceTypeName: String,
        accountId: String
    ) {
        self.resourceId = resourceId
        self.displayName = displayName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.accountId = accountId
    }
}
