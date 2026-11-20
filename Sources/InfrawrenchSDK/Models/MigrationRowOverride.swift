/*
 * InfrawrenchSDK v1.123.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.123.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MigrationRowOverride: Codable, Hashable, Sendable {
    /// Target resource type, of the row's category.
    public var resourceTypeId: String?
    /// Target size: a catalog SKU or size-picker id.
    public var sizeId: String?

    public init(
        resourceTypeId: String? = nil,
        sizeId: String? = nil
    ) {
        self.resourceTypeId = resourceTypeId
        self.sizeId = sizeId
    }
}
