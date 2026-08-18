/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeployCreatedResource: Codable, Hashable, Sendable {
    public struct Sidecar: Codable, Hashable, Sendable {
        public var pluginId: String
        public var parentResourceId: String

        public init(
            pluginId: String,
            parentResourceId: String
        ) {
            self.pluginId = pluginId
            self.parentResourceId = parentResourceId
        }
    }

    public var pluginId: String
    public var accountId: String
    public var resourceTypeId: String
    public var resourceId: String
    public var externalId: String?
    public var displayName: String
    public var sidecar: Sidecar?

    public init(
        pluginId: String,
        accountId: String,
        resourceTypeId: String,
        resourceId: String,
        externalId: String? = nil,
        displayName: String,
        sidecar: Sidecar? = nil
    ) {
        self.pluginId = pluginId
        self.accountId = accountId
        self.resourceTypeId = resourceTypeId
        self.resourceId = resourceId
        self.externalId = externalId
        self.displayName = displayName
        self.sidecar = sidecar
    }
}
