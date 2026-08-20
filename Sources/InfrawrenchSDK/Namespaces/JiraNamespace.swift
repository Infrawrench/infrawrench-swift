/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JiraGetResult: Codable, Hashable, Sendable {
    public var integration: JiraIntegration?

    public init(
        integration: JiraIntegration? = nil
    ) {
        self.integration = integration
    }
}

/// `client.jira`
public final class JiraNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.jira.projects`
    public let projects: JiraProjectsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.projects = JiraProjectsNamespace(transport: transport)
    }

    /// Disconnect Jira
    ///
    /// Issue links already recorded are kept, so filed findings stay marked as
    /// filed.
    ///
    /// _Requires permission: `jira:write`._
    ///
    /// DELETE /api/org/{orgId}/jira
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
                path: "/api/org/{orgId}/jira",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get the org's Jira connection
    ///
    /// The stored API token is never returned; `tokenHint` stands in for it.
    ///
    /// _Requires permission: `jira:read`._
    ///
    /// GET /api/org/{orgId}/jira
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> JiraGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jira",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// File a finding as a Jira issue
    ///
    /// Creates the issue, then records the link between it and the finding. The
    /// link is what lets a list view show "already filed" instead of offering the
    /// button again.
    ///
    /// _Requires permission: `jira:write`._
    ///
    /// POST /api/org/{orgId}/jira/issues
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 502: Jira refused to create the issue, or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func issues(
        orgId: String? = nil,
        body: CreateJiraIssueInput,
        options: RequestOptions? = nil
    ) async throws -> CreateJiraIssueResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/jira/issues",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Look up filed issues for a set of findings
    ///
    /// _Requires permission: `jira:read`._
    ///
    /// GET /api/org/{orgId}/jira/links
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
        sourceKind: JiraSourceKind? = nil,
        sourceId: [String]? = nil,
        options: RequestOptions? = nil
    ) async throws -> [JiraIssueLink] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jira/links",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("sourceKind", sourceKind), QueryParameter("sourceId", sourceId)]
            ),
            options: options
        )
    }

    /// Connect Jira, or update the connection
    ///
    /// _Requires permission: `jira:write`._
    ///
    /// PUT /api/org/{orgId}/jira
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: JiraIntegrationInput,
        options: RequestOptions? = nil
    ) async throws -> JiraIntegration? {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/jira",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Check Jira credentials
    ///
    /// Calls GET /rest/api/3/myself on the site, so a wrong email or a revoked
    /// token is reported on the settings form rather than on the first attempt to
    /// file an issue.
    ///
    /// _Requires permission: `jira:write`._
    ///
    /// POST /api/org/{orgId}/jira/verify
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 502: Jira rejected the credentials or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func verify(
        orgId: String? = nil,
        body: JiraVerifyInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> JiraVerifyResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/jira/verify",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.jira.projects`
public final class JiraProjectsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List issue types valid in a project
    ///
    /// Reads the project's own create metadata rather than the global issue-type
    /// list, so the picker cannot offer a type the project's scheme would reject.
    /// Subtasks are excluded.
    ///
    /// _Requires permission: `jira:read`._
    ///
    /// GET /api/org/{orgId}/jira/projects/{key}/issue-types
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func issueTypes(
        orgId: String? = nil,
        key: String,
        options: RequestOptions? = nil
    ) async throws -> [JiraIssueType] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jira/projects/{key}/issue-types",
                pathParameters: ["orgId": orgId?.parameterValue, "key": key.parameterValue]
            ),
            options: options
        )
    }

    /// List Jira projects
    ///
    /// Backs the project picker, so nobody has to know a project key by hand.
    ///
    /// _Requires permission: `jira:read`._
    ///
    /// GET /api/org/{orgId}/jira/projects
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [JiraProject] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/jira/projects",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
