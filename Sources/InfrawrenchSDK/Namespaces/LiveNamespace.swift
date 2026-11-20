/*
 * InfrawrenchSDK v1.122.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.122.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.live`
public final class LiveNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get a live-update ticket
    ///
    /// A ticket for watching one topic: either `poll` (no push channel on this
    /// server) or a sealed Neon Realtime query scoped to the organization. Each
    /// topic needs the read permission of the list it signals; a ticket expires
    /// after about a minute and is renewed by asking again, which checks the
    /// permission again.
    ///
    /// POST /api/org/{orgId}/live/tickets
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func tickets(
        orgId: String? = nil,
        body: LiveTicketRequest,
        options: RequestOptions? = nil
    ) async throws -> LiveTicket {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/live/tickets",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
