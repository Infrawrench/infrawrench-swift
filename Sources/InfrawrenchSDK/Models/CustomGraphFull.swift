/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CustomGraphFull: Codable, Hashable, Sendable {
    public var id: String
    public var organizationId: String
    public var name: String
    public var description: String?
    public var source: String
    public var createdByUserId: String?
    public var sourceAuthorUserId: String?
    public var deletedAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        organizationId: String,
        name: String,
        description: String? = nil,
        source: String,
        createdByUserId: String? = nil,
        sourceAuthorUserId: String? = nil,
        deletedAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.organizationId = organizationId
        self.name = name
        self.description = description
        self.source = source
        self.createdByUserId = createdByUserId
        self.sourceAuthorUserId = sourceAuthorUserId
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
