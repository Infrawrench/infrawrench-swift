/*
 * InfrawrenchSDK v0.13.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.13.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Invitation: Codable, Hashable, Sendable {
    public var id: String
    public var email: String
    public var role: OrganizationRole
    public var roleId: String?
    public var roleName: String?
    public var acceptedAt: String?
    public var expiresAt: String
    public var createdAt: String

    public init(
        id: String,
        email: String,
        role: OrganizationRole,
        roleId: String? = nil,
        roleName: String? = nil,
        acceptedAt: String? = nil,
        expiresAt: String,
        createdAt: String
    ) {
        self.id = id
        self.email = email
        self.role = role
        self.roleId = roleId
        self.roleName = roleName
        self.acceptedAt = acceptedAt
        self.expiresAt = expiresAt
        self.createdAt = createdAt
    }
}
