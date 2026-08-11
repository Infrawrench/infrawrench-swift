/*
 * InfrawrenchSDK v1.13.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.13.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.orphans`
public final class OrphansNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List likely-orphaned and idle resources
    ///
    /// Scans the organization's already-synced resources against each plugin's
    /// declarative orphan heuristics — unattached volumes, unassigned
    /// floating/elastic IPs, reserved-but-unused static IPs — and returns the
    /// matches grouped by account, each with the plugin's reason. Purely a read
    /// over stored state: no provider API calls are made, so results reflect the
    /// last sync. Where the org's collected cost data has per-resource rows,
    /// matches are annotated with trailing spend.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/orphans
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OrphanListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/orphans",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
