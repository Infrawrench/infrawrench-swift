/*
 * InfrawrenchSDK v1.16.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.16.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChildResourceRef: Codable, Hashable, Sendable {
    public var id: ResourceId
    public var displayName: String
    public var resourceTypeId: String
    public var pluginId: String
    public var accountId: String
    public var status: StatusDot?
    public var fields: JsonObject?

    public init(
        id: ResourceId,
        displayName: String,
        resourceTypeId: String,
        pluginId: String,
        accountId: String,
        status: StatusDot? = nil,
        fields: JsonObject? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.resourceTypeId = resourceTypeId
        self.pluginId = pluginId
        self.accountId = accountId
        self.status = status
        self.fields = fields
    }
}
