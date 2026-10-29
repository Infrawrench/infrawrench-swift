/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RoleDefaultDashboard: Codable, Hashable, Sendable {
    public var roleId: String
    public var roleName: String
    public var isSystem: Bool
    public var systemKey: String?
    /// Null when the role has no default and its members fall through to the
    /// organization default.
    public var dashboardId: String?

    public init(
        roleId: String,
        roleName: String,
        isSystem: Bool,
        systemKey: String? = nil,
        dashboardId: String? = nil
    ) {
        self.roleId = roleId
        self.roleName = roleName
        self.isSystem = isSystem
        self.systemKey = systemKey
        self.dashboardId = dashboardId
    }
}
