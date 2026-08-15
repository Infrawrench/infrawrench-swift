/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MeResponse: Codable, Hashable, Sendable {
    public var userId: String
    public var email: String
    public var role: RoleSummary?
    public var permissions: [Permission]

    public init(
        userId: String,
        email: String,
        role: RoleSummary? = nil,
        permissions: [Permission]
    ) {
        self.userId = userId
        self.email = email
        self.role = role
        self.permissions = permissions
    }
}
