/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.blastRadius`
public final class BlastRadiusNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// What breaks if this resource is deleted
    ///
    /// An impact report for one resource, assembled from the dependency graph
    /// walked inbound, network flow attribution, and the org objects that name
    /// the resource without depending on it (dashboards, custom graphs, probes,
    /// status pages, metric alerts, leases, schedules, saved log queries,
    /// workflows, and its recorded owner).
    ///
    /// The endpoint answers 200 with a partial report rather than failing when a
    /// source is unavailable; `unchecked` says which, in prose.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/blast-radius
    ///
    /// Raises on 400: Missing resourceId
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        resourceId: ResourceId,
        options: RequestOptions? = nil
    ) async throws -> BlastRadiusReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/blast-radius",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId)]
            ),
            options: options
        )
    }
}
