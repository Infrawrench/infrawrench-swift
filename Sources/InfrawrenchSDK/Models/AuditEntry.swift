/*
 * InfrawrenchSDK v0.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AuditEntry: Codable, Hashable, Sendable {
    public var id: String
    public var userId: String?
    public var apiKeyId: String?
    public var action: String
    public var entityType: String
    public var entityId: String
    public var metadata: JsonObject?
    public var ipAddress: String?
    public var createdAt: String
    public var userName: String?
    public var userEmail: String?

    public init(
        id: String,
        userId: String? = nil,
        apiKeyId: String? = nil,
        action: String,
        entityType: String,
        entityId: String,
        metadata: JsonObject? = nil,
        ipAddress: String? = nil,
        createdAt: String,
        userName: String? = nil,
        userEmail: String? = nil
    ) {
        self.id = id
        self.userId = userId
        self.apiKeyId = apiKeyId
        self.action = action
        self.entityType = entityType
        self.entityId = entityId
        self.metadata = metadata
        self.ipAddress = ipAddress
        self.createdAt = createdAt
        self.userName = userName
        self.userEmail = userEmail
    }
}
