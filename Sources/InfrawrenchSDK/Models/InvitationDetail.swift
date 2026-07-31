/*
 * InfrawrenchSDK v0.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InvitationDetail: Codable, Hashable, Sendable {
    public var id: String
    public var email: String
    public var role: OrganizationRole
    public var expiresAt: String
    public var acceptedAt: String?
    public var organizationId: String
    public var organizationName: String

    public init(
        id: String,
        email: String,
        role: OrganizationRole,
        expiresAt: String,
        acceptedAt: String? = nil,
        organizationId: String,
        organizationName: String
    ) {
        self.id = id
        self.email = email
        self.role = role
        self.expiresAt = expiresAt
        self.acceptedAt = acceptedAt
        self.organizationId = organizationId
        self.organizationName = organizationName
    }
}
