/*
 * InfrawrenchSDK v1.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.status`
public final class StatusNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Read a public status page
    ///
    /// **Unauthenticated.** The only endpoint in this API that takes no
    /// credentials — a status page exists for people with no account. The payload
    /// carries labels, states and uptime history only: probe URLs, resource and
    /// account ids, the organization id and error detail are never included. An
    /// unpublished page and an unknown slug both answer 404, so the endpoint
    /// cannot be used to confirm that a slug is real.
    ///
    /// GET /api/status/{slug}
    ///
    /// Raises on 404: Not found
    public func get(
        slug: String,
        options: RequestOptions? = nil
    ) async throws -> PublicStatusPage {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/status/{slug}",
                pathParameters: ["slug": slug.parameterValue]
            ),
            options: options
        )
    }
}
