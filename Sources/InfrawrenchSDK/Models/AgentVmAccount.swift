/*
 * InfrawrenchSDK v0.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentVmAccount: Codable, Hashable, Sendable {
    public var accountId: String
    public var accountName: String
    public var pluginId: String
    public var pluginName: String
    public var pluginLogoSvg: String?
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var defaultUsername: String
    public var defaultFields: [String: String]
    public var defaultFieldLabels: [String: String]?
    public var createFields: [JsonObject]?
    public var hiddenFieldKeys: [String]

    public init(
        accountId: String,
        accountName: String,
        pluginId: String,
        pluginName: String,
        pluginLogoSvg: String? = nil,
        resourceTypeId: String,
        resourceTypeName: String,
        defaultUsername: String,
        defaultFields: [String: String],
        defaultFieldLabels: [String: String]? = nil,
        createFields: [JsonObject]? = nil,
        hiddenFieldKeys: [String]
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.pluginLogoSvg = pluginLogoSvg
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.defaultUsername = defaultUsername
        self.defaultFields = defaultFields
        self.defaultFieldLabels = defaultFieldLabels
        self.createFields = createFields
        self.hiddenFieldKeys = hiddenFieldKeys
    }
}
