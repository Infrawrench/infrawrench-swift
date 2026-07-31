/*
 * InfrawrenchSDK v0.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.search`
public final class SearchNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Search resources (capped at 50 hits) and workflows across the org
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/search
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        q: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [SearchHit] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/search",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("q", q)]
            ),
            options: options
        )
    }
}
