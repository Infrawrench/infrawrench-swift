/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
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

public struct LinearWebhookUrlResult: Codable, Hashable, Sendable {
    public var url: String

    public init(
        url: String
    ) {
        self.url = url
    }
}

/// `client.linear`
public final class LinearNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.linear.links`
    public let links: LinearLinksNamespace
    /// `client.linear.webhook`
    public let webhook: LinearWebhookNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.links = LinearLinksNamespace(transport: transport)
        self.webhook = LinearWebhookNamespace(transport: transport)
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

    /// List Linear teams
    ///
    /// Backs the team picker, so nobody has to know a team id by hand;
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

/// `client.linear.links`
public final class LinearLinksNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
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
    /// return every link of the kind; this is the batch lookup a list view makes
    /// once instead of one request per row.
    public func list(
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

    /// Refresh the status of filed Linear issues now
    ///
    /// Reads up to 200 of the org's filed issues from Linear (least recently
    /// checked first) instead of waiting for a webhook or the poll.
    ///
    /// _Requires permission: `linear:read`._
    ///
    /// POST /api/org/{orgId}/linear/links/refresh
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 502: Linear refused or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func refresh(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> IssueStatusRefreshResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/linear/links/refresh",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.linear.webhook`
public final class LinearWebhookNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Set up the issue status webhook
    ///
    /// `auto` creates a webhook in Linear for `Issue` events on all public teams,
    /// signed with a secret Infrawrench generates (Linear allows this for
    /// workspace admins only). `manual` records a webhook somebody created in
    /// Linear's settings at the URL from `POST /linear/webhook/url`, with the
    /// signing secret Linear showed them. Replaces any webhook set up before.
    ///
    /// _Requires permission: `linear:write`._
    ///
    /// POST /api/org/{orgId}/linear/webhook
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 502: Linear refused or was unreachable
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: LinearWebhookInput,
        options: RequestOptions? = nil
    ) async throws -> IssueWebhookSetupResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/linear/webhook",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Remove the issue status webhook
    ///
    /// Deletes the webhook in Linear when Infrawrench created it. Statuses keep
    /// refreshing through the poll.
    ///
    /// _Requires permission: `linear:write`._
    ///
    /// DELETE /api/org/{orgId}/linear/webhook
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 502: Linear refused or was unreachable
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
                path: "/api/org/{orgId}/linear/webhook",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get the receiver URL for a hand-made Linear webhook
    ///
    /// Linear shows a webhook's signing secret only after it exists, so the URL
    /// comes first; record the secret afterwards with `POST /linear/webhook` in
    /// `manual` mode.
    ///
    /// _Requires permission: `linear:write`._
    ///
    /// POST /api/org/{orgId}/linear/webhook/url
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func url(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> LinearWebhookUrlResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/linear/webhook/url",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
