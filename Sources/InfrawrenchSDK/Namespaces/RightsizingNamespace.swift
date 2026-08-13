/*
 * InfrawrenchSDK v1.24.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.24.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.rightsizing`
public final class RightsizingNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List oversized resources with resize recommendations
    ///
    /// Computes p95 CPU/memory utilisation over the last 14 days of stored
    /// metrics for every resource whose plugin declares right-sizing support, and
    /// matches under-utilised ones against the plugin's real size catalog (the
    /// create form's size options, live-priced). Each recommendation names the
    /// cheapest smaller size that still clears a headroom margin and quotes the
    /// monthly saving. Apply one by submitting `sizeFieldKey` with the
    /// recommended size id through the resource-update endpoint — which enforces
    /// change freezes and writes the audit trail. Results are cached for a few
    /// minutes; pass `refresh=true` to recompute.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/rightsizing
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter refresh: Bypass the short server-side cache and recompute now.
    /// One of `true`, `false`.
    public func get(
        orgId: String? = nil,
        refresh: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> RightsizingListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/rightsizing",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("refresh", refresh)]
            ),
            options: options
        )
    }
}
