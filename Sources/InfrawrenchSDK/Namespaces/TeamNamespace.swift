/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.team`
public final class TeamNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.team.invitations`
    public let invitations: TeamInvitationsNamespace
    /// `client.team.members`
    public let members: TeamMembersNamespace
    /// `client.team.roles`
    public let roles: TeamRolesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.invitations = TeamInvitationsNamespace(transport: transport)
        self.members = TeamMembersNamespace(transport: transport)
        self.roles = TeamRolesNamespace(transport: transport)
    }

    /// Current user's effective permissions and role
    ///
    /// GET /api/org/{orgId}/team/me
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func me(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> MeResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/team/me",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List all permission strings the server recognises
    ///
    /// _Requires permission: `team:read`._
    ///
    /// GET /api/org/{orgId}/team/permissions
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func permissions(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PermissionCatalog {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/team/permissions",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.team.invitations`
public final class TeamInvitationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create an invitation (token valid for 7 days)
    ///
    /// _Requires permission: `team:invite`._
    ///
    /// POST /api/org/{orgId}/team/invitations
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// Raises on 403: The role would grant permissions the caller does not hold,
    /// or the caller is not an owner and tried to invite an owner
    ///
    /// Raises on 409: All seats are in use; retry with addSeat to buy one more
    ///
    /// Raises on 502: Buying the extra seat failed; the invitation was not sent
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: InviteRequest,
        options: RequestOptions? = nil
    ) async throws -> InviteResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/team/invitations",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Revoke a pending invitation
    ///
    /// _Requires permission: `team:invite`._
    ///
    /// DELETE /api/org/{orgId}/team/invitations/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/team/invitations/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List pending and historical invitations
    ///
    /// _Requires permission: `team:read`._
    ///
    /// GET /api/org/{orgId}/team/invitations
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [Invitation] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/team/invitations",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.team.members`
public final class TeamMembersNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Remove a member from the org
    ///
    /// _Requires permission: `team:remove`._
    ///
    /// DELETE /api/org/{orgId}/team/members/{id}
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/team/members/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List org members
    ///
    /// _Requires permission: `team:read`._
    ///
    /// GET /api/org/{orgId}/team/members
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [OrgMember] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/team/members",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Change a member's role
    ///
    /// _Requires permission: `team:role:write`._
    ///
    /// PATCH /api/org/{orgId}/team/members/{id}/role
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func role(
        orgId: String? = nil,
        id: String,
        body: RoleChangeRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/team/members/{id}/role",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.team.roles`
public final class TeamRolesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a custom role
    ///
    /// _Requires permission: `team:role:write`._
    ///
    /// POST /api/org/{orgId}/team/roles
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: RoleCreateRequest,
        options: RequestOptions? = nil
    ) async throws -> Role {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/team/roles",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a custom role (must have no members or pending invitations)
    ///
    /// _Requires permission: `team:role:write`._
    ///
    /// DELETE /api/org/{orgId}/team/roles/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 422: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/team/roles/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List roles (system + custom)
    ///
    /// _Requires permission: `team:read`._
    ///
    /// GET /api/org/{orgId}/team/roles
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [Role] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/team/roles",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Edit a custom role
    ///
    /// _Requires permission: `team:role:write`._
    ///
    /// PATCH /api/org/{orgId}/team/roles/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 422: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: RoleUpdateRequest,
        options: RequestOptions? = nil
    ) async throws -> Role {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/team/roles/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
