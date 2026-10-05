/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostVisibilityGetResult: Codable, Hashable, Sendable {
    public var scopes: [CostVisibilityScope]

    public init(
        scopes: [CostVisibilityScope]
    ) {
        self.scopes = scopes
    }
}

/// `client.costVisibility`
public final class CostVisibilityNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Remove a cost visibility scope
    ///
    /// _Requires permission: `team:role:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-visibility/{principalKind}/{principalId}
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        principalKind: CostVisibilityPrincipalKind,
        principalId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/cost-visibility/{principalKind}/{principalId}",
                pathParameters: ["orgId": orgId?.parameterValue, "principalKind": principalKind.parameterValue, "principalId": principalId.parameterValue]
            ),
            options: options
        )
    }

    /// List cost visibility scopes
    ///
    /// Every scope narrowing which cost rows a role, member or API key can see.
    /// Scopes that apply to one caller are intersected.
    ///
    /// _Requires permission: `team:read`._
    ///
    /// GET /api/org/{orgId}/cost-visibility
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostVisibilityGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-visibility",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Create or replace a cost visibility scope
    ///
    /// Upserts the scope of one principal. Roles and members need
    /// `team:role:write`; an API key's owner may also scope their own key with
    /// `apikeys:write`. Owners cannot be scoped, and cost-scoped callers cannot
    /// change scopes.
    ///
    /// _Requires permission: `team:role:write`._
    ///
    /// PUT /api/org/{orgId}/cost-visibility
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: CostVisibilityScopeInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostVisibilityScope {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-visibility",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
