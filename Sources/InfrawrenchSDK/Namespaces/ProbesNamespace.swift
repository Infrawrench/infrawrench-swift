/*
 * InfrawrenchSDK v0.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.probes`
public final class ProbesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a probe
    ///
    /// Point an uptime/latency check at an endpoint. Numeric inputs are clamped
    /// into their allowed ranges rather than rejected; the first check runs
    /// within one poller tick. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/probes
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: SyntheticProbeCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> SyntheticProbe {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/probes",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a probe
    ///
    /// Remove the probe. Recorded series age out of the metric store.
    /// Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/probes/{probeId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        probeId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/probes/{probeId}",
                pathParameters: ["orgId": orgId?.parameterValue, "probeId": probeId.parameterValue]
            ),
            options: options
        )
    }

    /// List synthetic probes
    ///
    /// Every probe in the organization with its live status, consecutive-failure
    /// count, last latency and trailing-24h uptime. Probes run on an interval
    /// from an edge proxy outside the cluster, so results reflect what an
    /// internet client would see.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/probes
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SyntheticProbeList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/probes",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Read a probe's recorded series
    ///
    /// The "Latency" (ms) and "Up" (1/0) series over a time range, from the
    /// shared metric store. Resolution auto-selects raw/1-minute/1-hour rollups
    /// by span. Defaults to the trailing 24 hours.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/probes/{probeId}/metrics
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter startMs: Range start, Unix epoch ms.
    ///
    /// - Parameter endMs: Range end, Unix epoch ms.
    public func metrics(
        orgId: String? = nil,
        probeId: String,
        startMs: String? = nil,
        endMs: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ProbeMetrics {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/probes/{probeId}/metrics",
                pathParameters: ["orgId": orgId?.parameterValue, "probeId": probeId.parameterValue],
                query: [QueryParameter("startMs", startMs), QueryParameter("endMs", endMs)]
            ),
            options: options
        )
    }

    /// Suggest endpoints from synced resources
    ///
    /// Endpoint candidates mined from the organization's synced resource outputs
    /// and fields (keys like url, endpoint, host, domain, publicIp). A cheap read
    /// over stored state — no provider API calls. Deduplicated by URL.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/probes/suggestions
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func suggestions(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ProbeSuggestions {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/probes/suggestions",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update or disable a probe
    ///
    /// Edit settings and/or toggle `enabled`. Changing the URL or method resets
    /// the probe's state to `unknown` — the history belongs to the old endpoint.
    /// Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/probes/{probeId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        probeId: String,
        body: SyntheticProbeUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> SyntheticProbe {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/probes/{probeId}",
                pathParameters: ["orgId": orgId?.parameterValue, "probeId": probeId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
