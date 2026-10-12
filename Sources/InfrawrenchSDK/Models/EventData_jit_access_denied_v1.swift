/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `jit_access.denied` event, version 1. An approver denied a
/// just-in-time access request.
public struct EventData_jit_access_denied_v1: Codable, Hashable, Sendable {
    /// Just-in-time access request id.
    public var requestId: String
    /// The account the role is granted through.
    public var accountId: String
    /// Provider plugin id.
    public var pluginId: String
    /// Scope the role applies to (project, subscription, account).
    public var scopeId: String
    /// The provider role.
    public var roleId: String
    /// Provider principal receiving the role.
    public var principalId: String?
    /// Infrawrench user who asked.
    public var requesterUserId: String
    /// Who caused this change; null for the expiry sweep.
    public var actorName: String?
    /// Requested duration.
    public var durationMinutes: Int?

    public init(
        requestId: String,
        accountId: String,
        pluginId: String,
        scopeId: String,
        roleId: String,
        principalId: String? = nil,
        requesterUserId: String,
        actorName: String? = nil,
        durationMinutes: Int? = nil
    ) {
        self.requestId = requestId
        self.accountId = accountId
        self.pluginId = pluginId
        self.scopeId = scopeId
        self.roleId = roleId
        self.principalId = principalId
        self.requesterUserId = requesterUserId
        self.actorName = actorName
        self.durationMinutes = durationMinutes
    }
}
