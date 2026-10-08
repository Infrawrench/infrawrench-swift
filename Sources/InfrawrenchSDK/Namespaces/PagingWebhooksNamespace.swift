/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.pagingWebhooks`
public final class PagingWebhooksNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Inbound paging provider webhook
    ///
    /// Called by the provider, not by clients. The token in the path picks the
    /// account; the provider's signature, verified with the stored secret,
    /// authenticates the delivery. The payload is treated as a nudge: each
    /// incident it names is re-read from the provider's API.
    ///
    /// POST /api/paging-webhooks/{token}
    ///
    /// Raises on 401: The signature did not verify
    ///
    /// Raises on 404: Unknown token
    public func create(
        token: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "POST",
                path: "/api/paging-webhooks/{token}",
                pathParameters: ["token": token.parameterValue]
            ),
            options: options
        )
    }
}
