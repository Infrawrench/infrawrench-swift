/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.agentRegistrations`
public final class AgentRegistrationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Revoke an agent registration
    ///
    /// The row is kept so audit entries naming this agent stay legible; its
    /// credential stops working on the next request. Closed to agent credentials.
    ///
    /// _Requires permission: `team:invite`._
    ///
    /// DELETE /api/org/{orgId}/agent-registrations/{id}
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
    ) async throws -> AgentRevoked {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/agent-registrations/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List the agent registrations acting in this organization
    ///
    /// _Requires permission: `team:read`._
    ///
    /// GET /api/org/{orgId}/agent-registrations
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
    ) async throws -> [AgentRegistration] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/agent-registrations",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Edit a platform agent's label, scopes or providers
    ///
    /// Platform agents only (`kind: platform`). Scopes must be within the link's
    /// current ceiling, and you may only add scopes you hold yourself. Closed to
    /// agent credentials.
    ///
    /// _Requires permission: `team:invite`._
    ///
    /// PATCH /api/org/{orgId}/agent-registrations/{id}
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
    /// Raises on 409: The agent or its link has been revoked
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
    public func update(
        orgId: String? = nil,
        id: String,
        body: PatchPlatformAgent? = nil,
        options: RequestOptions? = nil
    ) async throws -> PlatformAgentEnvelope {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/agent-registrations/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
