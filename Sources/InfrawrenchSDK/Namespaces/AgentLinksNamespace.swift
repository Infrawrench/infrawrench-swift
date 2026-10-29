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

public struct AgentLinksRequestsTokenBody: Codable, Hashable, Sendable {
    public var deviceCode: String

    public init(
        deviceCode: String
    ) {
        self.deviceCode = deviceCode
    }
}

/// `client.agentLinks`
public final class AgentLinksNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.agentLinks.requests`
    public let requests: AgentLinksRequestsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.requests = AgentLinksRequestsNamespace(transport: transport)
    }

    /// Revoke a platform link and every agent it made
    ///
    /// Closed to agent credentials.
    ///
    /// _Requires permission: `team:invite`._
    ///
    /// DELETE /api/org/{orgId}/agent-links/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required: the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> AgentLinkRevoked {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/agent-links/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List the platforms linked to this organization
    ///
    /// _Requires permission: `team:read`._
    ///
    /// GET /api/org/{orgId}/agent-links
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 402: Payment required: the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on reauth: Recent sign-in required. Send the user through sign-in
    /// again and retry; the request itself was well-formed.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [AgentLinkSummary] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/agent-links",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.agentLinks.requests`
public final class AgentLinksRequestsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Approve a link request into an organization
    ///
    /// Session only. Needs `team:invite` in the organization; `scopes` (the
    /// ceiling) must be within what you hold there, break-glass elevation
    /// excluded, minus permissions no agent may hold.
    ///
    /// POST /api/agent-links/requests/approve
    ///
    /// Raises on 400: Bad code, or `scope_not_allowed`
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 403: You lack `team:invite` there
    ///
    /// Raises on 409: Already decided or expired
    ///
    /// Raises on 429: Too many attempts
    public func approve(
        body: AgentLinkApprove? = nil,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent-links/requests/approve",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Start linking a platform (device flow)
    ///
    /// Unauthenticated, rate limited per source address.
    ///
    /// POST /api/agent-links/requests
    ///
    /// Raises on 400: Malformed platform, label or scopes
    ///
    /// Raises on 429: Too many requests from this address
    public func create(
        body: AgentLinkRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> AgentLinkRequestStarted {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent-links/requests",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Deny a link request
    ///
    /// POST /api/agent-links/requests/deny
    ///
    /// Raises on 400: Bad code
    ///
    /// Raises on 401: Unauthenticated
    public func deny(
        body: AgentLinkCode? = nil,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent-links/requests/deny",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Resolve a user code for the approval page
    ///
    /// Session only. A POST with the code in the body rather than a query string:
    /// the code is a live bearer secret. Rate limited per user.
    ///
    /// POST /api/agent-links/requests/lookup
    ///
    /// Raises on 400: Malformed, unknown or expired code
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 429: Too many attempts
    public func lookup(
        body: AgentLinkCode? = nil,
        options: RequestOptions? = nil
    ) async throws -> AgentLinkLookup {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent-links/requests/lookup",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Poll a link request
    ///
    /// POST /api/agent-links/requests/token
    ///
    /// Raises on 429: Polling faster than `interval`: `{ error: "slow_down" }`
    public func token(
        body: AgentLinksRequestsTokenBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> AgentLinkPoll {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/agent-links/requests/token",
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
