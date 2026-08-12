/*
 * InfrawrenchSDK v1.17.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.17.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ConnectSecretExportRequest: Codable, Hashable, Sendable {
    public var sourceAccountId: String
    public var sourceResourceId: ResourceId
    public var sourcePluginId: String
    public var sourceResourceTypeId: String
    public var sourceExternalId: String?
    public var targetAccountId: String
    public var targetPluginId: String
    public var templateId: String
    public var namespace: String
    public var secretName: String
    public var keyOverrides: [String: String]

    public init(
        sourceAccountId: String,
        sourceResourceId: ResourceId,
        sourcePluginId: String,
        sourceResourceTypeId: String,
        sourceExternalId: String? = nil,
        targetAccountId: String,
        targetPluginId: String,
        templateId: String,
        namespace: String,
        secretName: String,
        keyOverrides: [String: String]
    ) {
        self.sourceAccountId = sourceAccountId
        self.sourceResourceId = sourceResourceId
        self.sourcePluginId = sourcePluginId
        self.sourceResourceTypeId = sourceResourceTypeId
        self.sourceExternalId = sourceExternalId
        self.targetAccountId = targetAccountId
        self.targetPluginId = targetPluginId
        self.templateId = templateId
        self.namespace = namespace
        self.secretName = secretName
        self.keyOverrides = keyOverrides
    }
}
