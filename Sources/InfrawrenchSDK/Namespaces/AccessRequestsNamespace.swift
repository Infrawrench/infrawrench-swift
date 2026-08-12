/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.accessRequests`
public final class AccessRequestsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Approve an access request
    ///
    /// Opens the elevation window: the requester holds the requested permissions
    /// from now until `grantExpiresAt`, on every surface at once (HTTP, the
    /// WebSocket gateway, chat, MCP tools). Two rules are enforced here and
    /// cannot be bypassed: you cannot decide your own request (403
    /// `self_approval`), and you cannot grant a permission you do not hold
    /// yourself (403 `exceeds_approver`) — denying something aimed higher than
    /// you is allowed. Deciding a request that has already been decided or has
    /// timed out is a 409. Audit-logged.
    ///
    /// _Requires permission: `access:approve`._
    ///
    /// POST /api/org/{orgId}/access-requests/{requestId}/approve
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Self-approval, or granting beyond the approver's own
    /// permissions
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Already decided, or the request timed out
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func approve(
        orgId: String? = nil,
        requestId: String,
        body: AccessDecision? = nil,
        options: RequestOptions? = nil
    ) async throws -> AccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/access-requests/{requestId}/approve",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Permissions a request may ask for
    ///
    /// The server's permission catalog plus the subset the caller already holds
    /// and the bounds on grant length. Served rather than hard-coded in clients
    /// so a picker cannot drift from what the server will accept.
    ///
    /// _Requires permission: `access:read`._
    ///
    /// GET /api/org/{orgId}/access-requests/catalog
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func catalog(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AccessRequestCatalog {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/access-requests/catalog",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Request elevated access
    ///
    /// Ask for specific permissions, for a specific number of minutes, with a
    /// reason. Rejected with 400 when the caller's role already grants every
    /// permission asked for — that is almost always a wrong permission string
    /// rather than a real request. Fans out to push, Slack (with Approve/Deny
    /// buttons) and Microsoft Teams under the Pages opt-in. Audit-logged.
    ///
    /// _Requires permission: `access:request`._
    ///
    /// POST /api/org/{orgId}/access-requests
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: AccessRequestCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> AccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/access-requests",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Deny an access request
    ///
    /// Records the refusal. Two rules are enforced here and cannot be bypassed:
    /// you cannot decide your own request (403 `self_approval`), and you cannot
    /// grant a permission you do not hold yourself (403 `exceeds_approver`) —
    /// denying something aimed higher than you is allowed. Deciding a request
    /// that has already been decided or has timed out is a 409. Audit-logged.
    ///
    /// _Requires permission: `access:approve`._
    ///
    /// POST /api/org/{orgId}/access-requests/{requestId}/deny
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Self-approval, or granting beyond the approver's own
    /// permissions
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Already decided, or the request timed out
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func deny(
        orgId: String? = nil,
        requestId: String,
        body: AccessDecision? = nil,
        options: RequestOptions? = nil
    ) async throws -> AccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/access-requests/{requestId}/deny",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// List access requests
    ///
    /// The organization's break-glass requests, newest first. A `pending` listing
    /// hides rows whose timeout has already passed, so the queue never offers a
    /// decision that would immediately be refused.
    ///
    /// _Requires permission: `access:read`._
    ///
    /// GET /api/org/{orgId}/access-requests
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter status: `pending` (awaiting a decision), `approved`, `denied`,
    /// or `expired` (nobody decided in time, or the requester withdrew it). An
    /// approved row is only *granting* permissions while `active` is true. One of
    /// `pending`, `approved`, `denied`, `expired`.
    ///
    /// - Parameter mine: Only the caller's own requests. One of `1`.
    ///
    /// - Parameter active: Only rows granting permissions right now. One of `1`.
    public func list(
        orgId: String? = nil,
        status: String? = nil,
        mine: String? = nil,
        active: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [AccessRequest] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/access-requests",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("status", status), QueryParameter("mine", mine), QueryParameter("active", active)]
            ),
            options: options
        )
    }

    /// End a live elevation early
    ///
    /// Allowed for anyone with `access:approve` and for the holder — giving back
    /// an elevation you no longer need must never require finding an approver.
    /// Applies from the next permission resolution; nothing is cached.
    /// Audit-logged.
    ///
    /// POST /api/org/{orgId}/access-requests/{requestId}/revoke
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The grant is not active
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func revoke(
        orgId: String? = nil,
        requestId: String,
        options: RequestOptions? = nil
    ) async throws -> AccessRequest {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/access-requests/{requestId}/revoke",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue]
            ),
            options: options
        )
    }

    /// Withdraw your own pending request
    ///
    /// Its own operation rather than a self-denial, so the audit trail
    /// distinguishes 'nobody would approve this' from 'they decided they didn't
    /// need it'. Audit-logged.
    ///
    /// _Requires permission: `access:request`._
    ///
    /// POST /api/org/{orgId}/access-requests/{requestId}/withdraw
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Already decided or expired
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func withdraw(
        orgId: String? = nil,
        requestId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/access-requests/{requestId}/withdraw",
                pathParameters: ["orgId": orgId?.parameterValue, "requestId": requestId.parameterValue]
            ),
            options: options
        )
    }
}
