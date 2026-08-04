/*
 * InfrawrenchSDK v0.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InvokeActionRequest: Codable, Hashable, Sendable {
    public var pluginId: String
    public var accountId: String
    public var resourceTypeId: String
    public var resourceId: ResourceId
    public var actionId: String
    public var parentResourceId: ResourceId?

    public init(
        pluginId: String,
        accountId: String,
        resourceTypeId: String,
        resourceId: ResourceId,
        actionId: String,
        parentResourceId: ResourceId? = nil
    ) {
        self.pluginId = pluginId
        self.accountId = accountId
        self.resourceTypeId = resourceTypeId
        self.resourceId = resourceId
        self.actionId = actionId
        self.parentResourceId = parentResourceId
    }
}
