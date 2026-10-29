/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
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

    /// Search resources, workflows and (with `kinds`) saved objects across the
    /// org
    ///
    /// Without `kinds`: resources (capped at 50, substring match over name,
    /// account, provider and type) and workflows; requires `resources:read`. With
    /// `kinds`: the command palette's index. Each named kind the caller's role
    /// can read is searched (a kind it cannot read is skipped, not refused),
    /// narrowed to the objects the caller could open (per-object sharing for cost
    /// reports, folders, dashboards and canvases; cost visibility for budgets),
    /// and fuzzy-ranked: every whitespace-separated token must match the name or
    /// a supporting label, as a substring or an in-order subsequence. At most 8
    /// hits per saved-object kind and 50 resources; kinds are ordered by their
    /// best hit.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/search
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter kinds: `all`, or a comma-separated list of `SearchResultKind`
    /// values. An unknown kind is a 400.
    public func list(
        orgId: String? = nil,
        q: String? = nil,
        kinds: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [SearchHit] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/search",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("q", q), QueryParameter("kinds", kinds)]
            ),
            options: options
        )
    }
}
