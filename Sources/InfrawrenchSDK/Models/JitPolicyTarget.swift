/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JitPolicyTarget: Codable, Hashable, Sendable {
    /// Provider id of the scope (account, project, namespace).
    public var scopeId: String
    public var scopeName: String
    /// Provider id of the role (permission set ARN, role name).
    public var roleId: String
    public var roleName: String

    public init(
        scopeId: String,
        scopeName: String,
        roleId: String,
        roleName: String
    ) {
        self.scopeId = scopeId
        self.scopeName = scopeName
        self.roleId = roleId
        self.roleName = roleName
    }
}
