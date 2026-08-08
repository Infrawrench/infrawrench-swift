/*
 * InfrawrenchSDK v0.44.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.44.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateConfigRequest: Codable, Hashable, Sendable {
    public var accountId: String
    public var resourceTypeId: String
    public var pluginId: String?
    public var parentResourceId: ResourceId?

    public init(
        accountId: String,
        resourceTypeId: String,
        pluginId: String? = nil,
        parentResourceId: ResourceId? = nil
    ) {
        self.accountId = accountId
        self.resourceTypeId = resourceTypeId
        self.pluginId = pluginId
        self.parentResourceId = parentResourceId
    }
}
