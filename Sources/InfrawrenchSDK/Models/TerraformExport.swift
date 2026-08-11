/*
 * InfrawrenchSDK v1.12.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.12.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TerraformExport: Codable, Hashable, Sendable {
    public struct Exported: Codable, Hashable, Sendable {
        public var id: ResourceId
        public var displayName: String
        public var pluginId: String
        public var resourceTypeId: String
        public var address: String
        public var importId: String?

        public init(
            id: ResourceId,
            displayName: String,
            pluginId: String,
            resourceTypeId: String,
            address: String,
            importId: String? = nil
        ) {
            self.id = id
            self.displayName = displayName
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.address = address
            self.importId = importId
        }
    }

    public struct Unsupported: Codable, Hashable, Sendable {
        public var id: ResourceId
        public var displayName: String
        public var pluginId: String
        public var resourceTypeId: String
        public var reason: String

        public init(
            id: ResourceId,
            displayName: String,
            pluginId: String,
            resourceTypeId: String,
            reason: String
        ) {
            self.id = id
            self.displayName = displayName
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.reason = reason
        }
    }

    public var hcl: String
    public var exported: [Exported]
    public var unsupported: [Unsupported]

    public init(
        hcl: String,
        exported: [Exported],
        unsupported: [Unsupported]
    ) {
        self.hcl = hcl
        self.exported = exported
        self.unsupported = unsupported
    }
}
