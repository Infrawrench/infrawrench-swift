/*
 * InfrawrenchSDK v0.1.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.1.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct UserSession: Codable, Hashable, Sendable {
    public var id: String
    public var ipAddress: String?
    public var userAgent: String?
    public var authMethod: String
    public var status: String
    public var expiresAt: String
    public var createdAt: String
    public var updatedAt: String
    /// True for the session making this request
    public var current: Bool

    public init(
        id: String,
        ipAddress: String? = nil,
        userAgent: String? = nil,
        authMethod: String,
        status: String,
        expiresAt: String,
        createdAt: String,
        updatedAt: String,
        current: Bool
    ) {
        self.id = id
        self.ipAddress = ipAddress
        self.userAgent = userAgent
        self.authMethod = authMethod
        self.status = status
        self.expiresAt = expiresAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.current = current
    }
}
