/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.statusPages`
public final class StatusPagesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a status page
    ///
    /// Creates a page with a freshly generated slug. `published` defaults to
    /// false, so creating a page never exposes anything — publish it as a
    /// separate, deliberate step.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/status-pages
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: StatusPageCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> StatusPage {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/status-pages",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a status page
    ///
    /// The page's link stops working. The probes it published are untouched.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/status-pages/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/status-pages/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List status pages
    ///
    /// Every status page in the organization, with the probes each publishes and
    /// whether it is currently reachable.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/status-pages
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> StatusPageListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/status-pages",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Issue a new public link
    ///
    /// Replaces the slug, revoking the current public URL immediately — the
    /// reroll for a link that ended up somewhere unintended. The page stays
    /// published.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/status-pages/{id}/rotate-slug
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rotateSlug(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> StatusPage {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/status-pages/{id}/rotate-slug",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Update a status page
    ///
    /// Omitted fields keep their value. `components`, when present, replaces the
    /// whole ordered set — which is also how a reorder is expressed.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/status-pages/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: StatusPagePatch? = nil,
        options: RequestOptions? = nil
    ) async throws -> StatusPage {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/status-pages/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
