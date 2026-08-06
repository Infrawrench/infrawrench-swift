/*
 * InfrawrenchSDK v0.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LogStreamSelector: Codable, Hashable, Sendable {
    /// Infrawrench resource id of the stream to tail — or, for a sidecar stream,
    /// the peer plugin's own resource id (not a stored row).
    public var resourceId: String
    public var accountId: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    /// Set for sidecar streams (e.g. a pod inside a managed cluster): the stored
    /// parent resource whose outputs mint the peer plugin's credentials. The logs
    /// endpoint routes through the peer client when present.
    public var parentResourceId: String?
    /// Container to fetch when the resource has more than one; omit for the
    /// default.
    public var container: String?

    public init(
        resourceId: String,
        accountId: String,
        pluginId: PluginId,
        resourceTypeId: String,
        parentResourceId: String? = nil,
        container: String? = nil
    ) {
        self.resourceId = resourceId
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.parentResourceId = parentResourceId
        self.container = container
    }
}
