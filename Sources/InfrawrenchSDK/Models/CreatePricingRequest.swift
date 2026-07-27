/*
 * InfrawrenchSDK v0.8.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.8.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreatePricingRequest: Codable, Hashable, Sendable {
    public struct Size: Codable, Hashable, Sendable {
        public var id: String
        public var vcpus: Double
        public var memoryMb: Double

        public init(
            id: String,
            vcpus: Double,
            memoryMb: Double
        ) {
            self.id = id
            self.vcpus = vcpus
            self.memoryMb = memoryMb
        }
    }

    public var accountId: String
    public var resourceTypeId: String
    public var regionId: String?
    public var sizes: [Size]
    public var pluginId: String?
    public var parentResourceId: ResourceId?

    public init(
        accountId: String,
        resourceTypeId: String,
        regionId: String? = nil,
        sizes: [Size],
        pluginId: String? = nil,
        parentResourceId: ResourceId? = nil
    ) {
        self.accountId = accountId
        self.resourceTypeId = resourceTypeId
        self.regionId = regionId
        self.sizes = sizes
        self.pluginId = pluginId
        self.parentResourceId = parentResourceId
    }
}
