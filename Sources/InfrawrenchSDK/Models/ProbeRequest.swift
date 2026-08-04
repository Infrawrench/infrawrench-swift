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

public struct ProbeRequest: Codable, Hashable, Sendable {
    public struct Item: Codable, Hashable, Sendable {
        public var resourceId: ResourceId
        public var accountId: String
        public var pluginId: String
        public var resourceTypeId: String

        public init(
            resourceId: ResourceId,
            accountId: String,
            pluginId: String,
            resourceTypeId: String
        ) {
            self.resourceId = resourceId
            self.accountId = accountId
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
        }
    }

    public var items: [Item]

    public init(
        items: [Item]
    ) {
        self.items = items
    }
}
