/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.envFiles`
public final class EnvFilesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Commit an .infraenv file to a repository
    ///
    /// Writes the file to the branch in one commit, or to a new branch with a
    /// pull request. The text is checked first: a file with syntax errors is
    /// refused, so nothing unparseable is committed. Values are never committed;
    /// the file only holds references.
    ///
    /// _Requires permission: `github-issues:write`._
    ///
    /// POST /api/org/{orgId}/env-files/commit
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The installation has not accepted the permission this
    /// needs. An owner of the GitHub account approves it from `manageUrl`.
    ///
    /// Raises on 502: Bad gateway: an upstream service failed
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func commit(
        orgId: String? = nil,
        body: InfraenvCommitRequest,
        options: RequestOptions? = nil
    ) async throws -> InfraenvCommitResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/env-files/commit",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Check an .infraenv file
    ///
    /// Parses the file and looks up every reference it makes: which resource,
    /// account and output each `resource()` names, and whether each `secret()`
    /// exists. Returns no values and calls no provider.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/env-files/describe
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func describe(
        orgId: String? = nil,
        body: InfraenvDescribeRequest,
        options: RequestOptions? = nil
    ) async throws -> InfraenvDescribeResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/env-files/describe",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Read an .infraenv file from a repository
    ///
    /// The file's text and blob sha on a branch (the default branch when
    /// omitted). A file that does not exist yet answers 200 with `content: null`.
    ///
    /// _Requires permission: `github-issues:read`._
    ///
    /// GET /api/org/{orgId}/env-files/repo-file
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The installation has not accepted the permission this
    /// needs. An owner of the GitHub account approves it from `manageUrl`.
    ///
    /// Raises on 502: Bad gateway: an upstream service failed
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter repo: `owner/name`.
    ///
    /// - Parameter path: Path of the file in the repository. Defaults to
    /// `.infraenv` in the editors.
    public func repoFile(
        orgId: String? = nil,
        installationId: String,
        repo: String,
        path: String,
        branch: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> InfraenvRepoFile {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/env-files/repo-file",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo), QueryParameter("path", path), QueryParameter("branch", branch)]
            ),
            options: options
        )
    }

    /// List repositories an .infraenv can be read from and committed to
    ///
    /// Every repository the organization's GitHub App installations can reach.
    ///
    /// _Requires permission: `github-issues:read`._
    ///
    /// GET /api/org/{orgId}/env-files/repos
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The installation has not accepted the permission this
    /// needs. An owner of the GitHub account approves it from `manageUrl`.
    ///
    /// Raises on 502: Bad gateway: an upstream service failed
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func repos(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> InfraenvRepoList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/env-files/repos",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Resolve an .infraenv file into .env values
    ///
    /// Resolves every variable of one environment: literals as written,
    /// `resource()` through the resource's provider, `secret()` from the
    /// organization's secrets. Returns the values in plaintext along with the
    /// generated `.env` text, and records an audit entry naming the variables
    /// (never their values). A variable that does not resolve is reported in
    /// `problems` and left out. A file with syntax errors answers 400.
    ///
    /// _Requires permission: `secrets:read`._
    ///
    /// POST /api/org/{orgId}/env-files/resolve
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func resolve(
        orgId: String? = nil,
        body: InfraenvResolveRequest,
        options: RequestOptions? = nil
    ) async throws -> InfraenvResolveResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/env-files/resolve",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List resources an .infraenv variable can reference
    ///
    /// Synced resources whose type declares outputs, each with those outputs and,
    /// where the type has a secret export template, the variable name it
    /// suggests. Backs the editor's picker.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/env-files/sources
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter q: Matches the resource's name, id, type or account.
    public func sources(
        orgId: String? = nil,
        q: String? = nil,
        limit: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> InfraenvSourceList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/env-files/sources",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("q", q), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }
}
