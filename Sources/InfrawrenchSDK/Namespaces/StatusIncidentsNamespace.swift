/*
 * InfrawrenchSDK v0.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.statusIncidents`
public final class StatusIncidentsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Provider incidents overlapping your resources
    ///
    /// The "is it me or is it them?" feed. The poller watches each provider
    /// plugin's public status feed (declared on its manifest — zero credentials,
    /// zero rate-limit risk), caches active incidents, and this endpoint
    /// correlates them against the resources the organization holds: an incident
    /// matches a resource when it is provider-wide, names the resource's region,
    /// or names its resource type. Includes incidents resolved within the last 24
    /// hours so recent drift can still be correlated. Active incidents first,
    /// most severe first.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/status-incidents
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OrgStatusIncidentsResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/status-incidents",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
