/*
 * InfrawrenchSDK v0.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PickerResource: Codable, Hashable, Sendable {
    public var id: ResourceId
    public var label: String
    public var pluginId: String
    public var resourceTypeId: String
    public var accountId: String
    public var outputKey: String
    public var outputValue: String

    public init(
        id: ResourceId,
        label: String,
        pluginId: String,
        resourceTypeId: String,
        accountId: String,
        outputKey: String,
        outputValue: String
    ) {
        self.id = id
        self.label = label
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.outputKey = outputKey
        self.outputValue = outputValue
    }
}
