/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.issueWebhooks`
public final class IssueWebhooksNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.issueWebhooks.jira`
    public let jira: IssueWebhooksJiraNamespace
    /// `client.issueWebhooks.linear`
    public let linear: IssueWebhooksLinearNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.jira = IssueWebhooksJiraNamespace(transport: transport)
        self.linear = IssueWebhooksLinearNamespace(transport: transport)
    }

    /// Inbound GitHub App webhook for issue status
    ///
    /// The GitHub App's webhook URL. `X-Hub-Signature-256` is verified with the
    /// server's `GITHUB_APP_WEBHOOK_SECRET`; `issues` events update the status of
    /// filed issues and `ping` is acknowledged. Every other event is ignored.
    ///
    /// POST /api/issue-webhooks/github
    ///
    /// Raises on 401: The signature did not verify
    ///
    /// Raises on 404: Unknown token, or (GitHub) no webhook secret configured on
    /// the server
    ///
    /// Raises on 500: Processing failed; the tracker retries
    public func github(
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "POST",
                path: "/api/issue-webhooks/github"
            ),
            options: options
        )
    }
}

/// `client.issueWebhooks.jira`
public final class IssueWebhooksJiraNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Inbound Jira webhook for issue status
    ///
    /// Called by Jira, not by clients. The token in the path picks the
    /// organization; `X-Hub-Signature: sha256=<hex>`, an HMAC of the raw body
    /// with the stored secret, authenticates the delivery. Handles
    /// `jira:issue_updated` and `jira:issue_deleted`.
    ///
    /// POST /api/issue-webhooks/jira/{token}
    ///
    /// Raises on 401: The signature did not verify
    ///
    /// Raises on 404: Unknown token, or (GitHub) no webhook secret configured on
    /// the server
    ///
    /// Raises on 500: Processing failed; the tracker retries
    public func create(
        token: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "POST",
                path: "/api/issue-webhooks/jira/{token}",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.issueWebhooks.linear`
public final class IssueWebhooksLinearNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Inbound Linear webhook for issue status
    ///
    /// Called by Linear, not by clients. The token in the path picks the
    /// organization; `Linear-Signature` (hex HMAC-SHA256 of the raw body)
    /// authenticates the delivery, and `webhookTimestamp` must be within a
    /// minute. Handles `Issue` create, update and remove.
    ///
    /// POST /api/issue-webhooks/linear/{token}
    ///
    /// Raises on 401: The signature did not verify
    ///
    /// Raises on 404: Unknown token, or (GitHub) no webhook secret configured on
    /// the server
    ///
    /// Raises on 500: Processing failed; the tracker retries
    public func create(
        token: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "POST",
                path: "/api/issue-webhooks/linear/{token}",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }
}
