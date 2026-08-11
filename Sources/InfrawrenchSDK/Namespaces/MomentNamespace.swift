/*
 * InfrawrenchSDK v1.10.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.10.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.moment`
public final class MomentNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Everything that happened around a timestamp
    ///
    /// "What changed around 03:14?" — one merged, chronological narrative of
    /// everything the platform knows happened in a window: resource changes
    /// (including sleep/wake schedule attribution), provider status incidents
    /// that started/resolved in or overlap the window, cost anomalies, workflow
    /// runs, deployments, audit-log entries, change freezes, and the drift/expiry
    /// alert deliveries. Each feed is gated on the same permission its own
    /// endpoint requires; feeds the caller cannot read are reported as `omitted`,
    /// and a feed whose query fails is reported as `error` without blanking the
    /// rest of the response.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/moment
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter at: Centre of the window. Defaults to now.
    ///
    /// - Parameter window: Half-window in minutes (the ± around `at`). Default
    /// 60, max 4320 (±3 days).
    public func get(
        orgId: String? = nil,
        at: String? = nil,
        window: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> MomentResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/moment",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("at", at), QueryParameter("window", window)]
            ),
            options: options
        )
    }
}
