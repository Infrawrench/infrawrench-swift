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

public struct PrChecksRepositoriesDeleteResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

/// `client.prChecks`
public final class PrChecksNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.prChecks.repositories`
    public let repositories: PrChecksRepositoriesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.repositories = PrChecksRepositoriesNamespace(transport: transport)
    }

    /// Get pull request check settings and installation access
    ///
    /// _Requires permission: `iac:read`._
    ///
    /// GET /api/org/{orgId}/pr-checks
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PrCheckStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/pr-checks",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Preview a pull request check without posting it
    ///
    /// Runs the same analysis the check posts, for a pull request in a configured
    /// repository or for file contents from a local diff. Reads only: nothing is
    /// posted to GitHub and nothing is stored.
    ///
    /// _Requires permission: `iac:read`._
    ///
    /// POST /api/org/{orgId}/pr-checks/preview
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 502: GitHub refused the request or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func preview(
        orgId: String? = nil,
        body: PrCheckPreviewInput,
        options: RequestOptions? = nil
    ) async throws -> PrCheckPreview {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/pr-checks/preview",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List recent pull request checks
    ///
    /// _Requires permission: `iac:read`._
    ///
    /// GET /api/org/{orgId}/pr-checks/runs
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func runs(
        orgId: String? = nil,
        repositoryId: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> [PrCheckRun] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/pr-checks/runs",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("repositoryId", repositoryId), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }
}

/// `client.prChecks.repositories`
public final class PrChecksRepositoriesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Turn on pull request checks for a repository
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/pr-checks/repositories
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: PrCheckRepositoryInput,
        options: RequestOptions? = nil
    ) async throws -> PrCheckRepository {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/pr-checks/repositories",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Stop pull request checks for a repository
    ///
    /// Removes the settings and the repository's check history.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/pr-checks/repositories/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> PrChecksRepositoriesDeleteResult {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/pr-checks/repositories/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get one repository's pull request check settings
    ///
    /// _Requires permission: `iac:read`._
    ///
    /// GET /api/org/{orgId}/pr-checks/repositories/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> PrCheckRepository {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/pr-checks/repositories/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List repositories with pull request checks
    ///
    /// _Requires permission: `iac:read`._
    ///
    /// GET /api/org/{orgId}/pr-checks/repositories
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [PrCheckRepository] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/pr-checks/repositories",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Replace one repository's pull request check settings
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/pr-checks/repositories/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: PrCheckRepositoryInput,
        options: RequestOptions? = nil
    ) async throws -> PrCheckRepository {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/pr-checks/repositories/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
