/*
 * InfrawrenchSDK v1.107.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.107.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.github`
public final class GithubNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.github.installations`
    public let installations: GithubInstallationsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.installations = GithubInstallationsNamespace(transport: transport)
    }

    /// GitHub App install URL
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// GET /api/org/{orgId}/github/install-url
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter return: The page (under the organization) the install flow
    /// returns to. Anything else: `agents`. One of `agents`, `workflows`,
    /// `settings/github-issues`, `settings/pr-checks`, `ci`.
    public func installUrl(
        orgId: String? = nil,
        `return`: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> GithubInstallUrl {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/github/install-url",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("return", `return`)]
            ),
            options: options
        )
    }

    /// Repositories the organization's installations can access
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/github/repos
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func repos(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> GithubAppRepos {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/github/repos",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// GitHub App connection status
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/github/status
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func status(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> GithubAppStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/github/status",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.github.installations`
public final class GithubInstallationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Disconnect a GitHub App installation
    ///
    /// Drops the connection here; the app stays installed on GitHub until
    /// uninstalled there.
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// DELETE /api/org/{orgId}/github/installations/{installationId}
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        installationId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/github/installations/{installationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "installationId": installationId.parameterValue]
            ),
            options: options
        )
    }
}
