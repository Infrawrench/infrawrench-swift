/*
 * InfrawrenchSDK v1.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.invitations`
public final class InvitationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.invitations.byToken`
    public let byToken: InvitationsByTokenNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.byToken = InvitationsByTokenNamespace(transport: transport)
    }

    /// Accept an invitation
    ///
    /// POST /api/invitations/accept
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    public func accept(
        body: AcceptInvitationRequest,
        options: RequestOptions? = nil
    ) async throws -> AcceptInvitationResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/invitations/accept",
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.invitations.byToken`
public final class InvitationsByTokenNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get invitation details by token
    ///
    /// GET /api/invitations/by-token/{token}
    ///
    /// Raises on 404: Not found
    public func get(
        token: String,
        options: RequestOptions? = nil
    ) async throws -> InvitationDetail {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/invitations/by-token/{token}",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }
}
