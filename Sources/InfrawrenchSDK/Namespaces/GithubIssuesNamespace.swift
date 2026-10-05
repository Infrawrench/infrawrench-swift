/*
 * InfrawrenchSDK v1.60.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.60.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.githubIssues`
public final class GithubIssuesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.githubIssues.pullRequests`
    public let pullRequests: GithubIssuesPullRequestsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.pullRequests = GithubIssuesPullRequestsNamespace(transport: transport)
    }

    /// List a repository's assignable users
    ///
    /// Backs the assignee picker.
    ///
    /// _Requires permission: `github-issues:read`._
    ///
    /// GET /api/org/{orgId}/github-issues/assignees
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: The GitHub App installation needs a permission an owner has
    /// not approved yet
    ///
    /// Raises on 502: GitHub refused the request or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func assignees(
        orgId: String? = nil,
        installationId: Int,
        repo: String,
        options: RequestOptions? = nil
    ) async throws -> [GithubAssignee] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/github-issues/assignees",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo)]
            ),
            options: options
        )
    }

    /// List a repository's branches
    ///
    /// Backs the base-branch picker for Terraform sources.
    ///
    /// _Requires permission: `github-issues:read`._
    ///
    /// GET /api/org/{orgId}/github-issues/branches
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: The GitHub App installation needs a permission an owner has
    /// not approved yet
    ///
    /// Raises on 502: GitHub refused the request or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func branches(
        orgId: String? = nil,
        installationId: Int,
        repo: String,
        options: RequestOptions? = nil
    ) async throws -> [String] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/github-issues/branches",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo)]
            ),
            options: options
        )
    }

    /// Get GitHub issue settings and installation access
    ///
    /// _Requires permission: `github-issues:read`._
    ///
    /// GET /api/org/{orgId}/github-issues
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> GithubIssuesStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/github-issues",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// File a finding as a GitHub issue
    ///
    /// Opens an issue in the routed repository, or comments on the open issue
    /// already filed for the same finding (matched by fingerprint, including a
    /// hidden marker in issue bodies).
    ///
    /// _Requires permission: `github-issues:write`._
    ///
    /// POST /api/org/{orgId}/github-issues/issues
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: The GitHub App installation needs a permission an owner has
    /// not approved yet
    ///
    /// Raises on 502: GitHub refused the request or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func issues(
        orgId: String? = nil,
        body: FileGithubIssueInput,
        options: RequestOptions? = nil
    ) async throws -> FileGithubIssueResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/github-issues/issues",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List a repository's labels
    ///
    /// Backs the label picker.
    ///
    /// _Requires permission: `github-issues:read`._
    ///
    /// GET /api/org/{orgId}/github-issues/labels
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: The GitHub App installation needs a permission an owner has
    /// not approved yet
    ///
    /// Raises on 502: GitHub refused the request or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func labels(
        orgId: String? = nil,
        installationId: Int,
        repo: String,
        options: RequestOptions? = nil
    ) async throws -> [GithubLabel] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/github-issues/labels",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo)]
            ),
            options: options
        )
    }

    /// Look up filed GitHub issues for a set of findings
    ///
    /// _Requires permission: `github-issues:read`._
    ///
    /// GET /api/org/{orgId}/github-issues/links
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter state: One of `open`, `closed`.
    public func links(
        orgId: String? = nil,
        sourceKind: GithubIssueSourceKind? = nil,
        state: String? = nil,
        sourceId: [String]? = nil,
        options: RequestOptions? = nil
    ) async throws -> [GithubIssueLink] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/github-issues/links",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("sourceKind", sourceKind), QueryParameter("state", state), QueryParameter("sourceId", sourceId)]
            ),
            options: options
        )
    }

    /// Resolve where a finding would be filed
    ///
    /// _Requires permission: `github-issues:read`._
    ///
    /// GET /api/org/{orgId}/github-issues/route
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func route(
        orgId: String? = nil,
        resourceId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> GithubIssueRouteResolution {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/github-issues/route",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId)]
            ),
            options: options
        )
    }

    /// Replace the GitHub issue settings
    ///
    /// Whole-document replace: route order is part of the meaning. Route and
    /// source ids are kept when supplied.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/github-issues/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func settings(
        orgId: String? = nil,
        body: GithubIssueSettingsInput,
        options: RequestOptions? = nil
    ) async throws -> GithubIssueSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/github-issues/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.githubIssues.pullRequests`
public final class GithubIssuesPullRequestsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Open an IaC pull request for a finding
    ///
    /// Creates a branch, commits the one-file change and opens a pull request
    /// against the mapped base branch. Never merged automatically.
    ///
    /// _Requires permission: `github-issues:write`._
    ///
    /// POST /api/org/{orgId}/github-issues/pull-requests
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: The GitHub App installation needs a permission an owner has
    /// not approved yet
    ///
    /// Raises on 502: GitHub refused the request or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: GithubPullRequestInput,
        options: RequestOptions? = nil
    ) async throws -> GithubPullRequestResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/github-issues/pull-requests",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Preview an IaC pull request for a finding
    ///
    /// Reads only. Says what the pull request would change (one file, as a diff),
    /// or why the change is not mechanical.
    ///
    /// _Requires permission: `github-issues:write`._
    ///
    /// POST /api/org/{orgId}/github-issues/pull-requests/preview
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: The GitHub App installation needs a permission an owner has
    /// not approved yet
    ///
    /// Raises on 502: GitHub refused the request or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func preview(
        orgId: String? = nil,
        body: GithubPullRequestInput,
        options: RequestOptions? = nil
    ) async throws -> GithubPullRequestPreview {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/github-issues/pull-requests/preview",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
