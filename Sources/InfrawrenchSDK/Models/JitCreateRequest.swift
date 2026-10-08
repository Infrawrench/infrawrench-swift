/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JitCreateRequest: Codable, Hashable, Sendable {
    public var policyId: String
    public var scopeId: String
    public var roleId: String
    public var durationMinutes: Int
    public var reason: String
    public var ticket: String?
    /// Only when the caller's email does not resolve; must be one the provider
    /// lists.
    public var principalId: String?

    public init(
        policyId: String,
        scopeId: String,
        roleId: String,
        durationMinutes: Int,
        reason: String,
        ticket: String? = nil,
        principalId: String? = nil
    ) {
        self.policyId = policyId
        self.scopeId = scopeId
        self.roleId = roleId
        self.durationMinutes = durationMinutes
        self.reason = reason
        self.ticket = ticket
        self.principalId = principalId
    }
}
