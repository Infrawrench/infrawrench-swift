/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LinearGetResult: Codable, Hashable, Sendable {
    public var integration: LinearIntegration?

    public init(
        integration: LinearIntegration? = nil
    ) {
        self.integration = integration
    }
}

/// `client.linear`
public final class LinearNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Disconnect Linear
    ///
    /// Issue links already recorded are kept, so filed findings stay marked as
    /// filed.
    ///
    /// _Requires permission: `linear:write`._
    ///
    /// DELETE /api/org/{orgId}/linear
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/linear",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get the org's Linear connection
    ///
    /// The stored API key is never returned; `keyHint` stands in for it.
    ///
    /// _Requires permission: `linear:read`._
    ///
    /// GET /api/org/{orgId}/linear
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> LinearGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/linear",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// File a finding as a Linear issue
    ///
    /// Creates the issue via the issueCreate mutation, then records the link
    /// between it and the finding. The link is what lets a list view show
    /// "already filed" instead of offering the button again.
    ///
    /// _Requires permission: `linear:write`._
    ///
    /// POST /api/org/{orgId}/linear/issues
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 502: Linear refused to create the issue, or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func issues(
        orgId: String? = nil,
        body: CreateLinearIssueInput,
        options: RequestOptions? = nil
    ) async throws -> CreateLinearIssueResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/linear/issues",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Look up filed issues for a set of findings
    ///
    /// _Requires permission: `linear:read`._
    ///
    /// GET /api/org/{orgId}/linear/links
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter sourceId: Repeat to narrow to specific findings. Omit to
    /// return every link of the kind — this is the batch lookup a list view makes
    /// once instead of one request per row.
    public func links(
        orgId: String? = nil,
        sourceKind: LinearSourceKind? = nil,
        sourceId: [String]? = nil,
        options: RequestOptions? = nil
    ) async throws -> [LinearIssueLink] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/linear/links",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("sourceKind", sourceKind), QueryParameter("sourceId", sourceId)]
            ),
            options: options
        )
    }

    /// List Linear teams
    ///
    /// Backs the team picker, so nobody has to know a team id by hand —
    /// issueCreate requires one, and every issue belongs to exactly one team.
    ///
    /// _Requires permission: `linear:read`._
    ///
    /// GET /api/org/{orgId}/linear/teams
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func teams(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [LinearTeam] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/linear/teams",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Connect Linear, or update the connection
    ///
    /// _Requires permission: `linear:write`._
    ///
    /// PUT /api/org/{orgId}/linear
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: LinearIntegrationInput,
        options: RequestOptions? = nil
    ) async throws -> LinearIntegration? {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/linear",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Check Linear credentials
    ///
    /// Runs the `viewer` query against the Linear GraphQL API, so a mistyped or
    /// revoked key is reported on the settings form rather than on the first
    /// attempt to file an issue.
    ///
    /// _Requires permission: `linear:write`._
    ///
    /// POST /api/org/{orgId}/linear/verify
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 502: Linear rejected the key or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func verify(
        orgId: String? = nil,
        body: LinearVerifyInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> LinearVerifyResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/linear/verify",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
