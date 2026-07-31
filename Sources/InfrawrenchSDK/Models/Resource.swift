/*
 * InfrawrenchSDK v0.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Resource: Codable, Hashable, Sendable {
    public var id: ResourceId
    public var pluginId: String
    public var resourceTypeId: String
    public var accountId: String
    public var displayName: String
    public var externalId: String?
    public var fieldsJson: JsonObject
    public var outputsJson: JsonObject
    public var parentResourceId: ResourceId?

    public init(
        id: ResourceId,
        pluginId: String,
        resourceTypeId: String,
        accountId: String,
        displayName: String,
        externalId: String? = nil,
        fieldsJson: JsonObject,
        outputsJson: JsonObject,
        parentResourceId: ResourceId? = nil
    ) {
        self.id = id
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.displayName = displayName
        self.externalId = externalId
        self.fieldsJson = fieldsJson
        self.outputsJson = outputsJson
        self.parentResourceId = parentResourceId
    }
}
