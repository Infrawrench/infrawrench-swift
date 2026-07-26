/*
 * InfrawrenchSDK v0.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DashboardFull: Codable, Hashable, Sendable {
    public var id: String
    public var organizationId: String
    public var name: String
    public var isDefault: Bool
    public var createdAt: String
    public var updatedAt: String
    public var deletedAt: String?
    public var syncVersion: Int

    public init(
        id: String,
        organizationId: String,
        name: String,
        isDefault: Bool,
        createdAt: String,
        updatedAt: String,
        deletedAt: String? = nil,
        syncVersion: Int
    ) {
        self.id = id
        self.organizationId = organizationId
        self.name = name
        self.isDefault = isDefault
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
        self.syncVersion = syncVersion
    }
}
