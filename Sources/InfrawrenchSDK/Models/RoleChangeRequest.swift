/*
 * InfrawrenchSDK v0.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RoleChangeRequest: Codable, Hashable, Sendable {
    public var role: OrganizationRole?
    public var roleId: String?

    public init(
        role: OrganizationRole? = nil,
        roleId: String? = nil
    ) {
        self.role = role
        self.roleId = roleId
    }
}
