/*
 * InfrawrenchSDK v0.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceChangeEntry: Codable, Hashable, Sendable {
    public var id: String
    public var resourceId: ResourceId
    public var accountId: String
    public var pluginId: String
    public var resourceTypeId: String
    /// Resource display name at the time of the change — survives deletion.
    public var displayName: String
    public var changeKind: ResourceChangeKind
    /// Changed fields for `updated` events; empty for `created` and `deleted`.
    public var diff: [ResourceFieldChange]
    public var createdAt: String

    public init(
        id: String,
        resourceId: ResourceId,
        accountId: String,
        pluginId: String,
        resourceTypeId: String,
        displayName: String,
        changeKind: ResourceChangeKind,
        diff: [ResourceFieldChange],
        createdAt: String
    ) {
        self.id = id
        self.resourceId = resourceId
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.displayName = displayName
        self.changeKind = changeKind
        self.diff = diff
        self.createdAt = createdAt
    }
}
