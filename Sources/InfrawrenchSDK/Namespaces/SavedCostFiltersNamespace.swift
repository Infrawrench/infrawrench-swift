/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SavedCostFiltersReferentsResult: Codable, Hashable, Sendable {
    public var referents: [SavedCostFilterReferent]

    public init(
        referents: [SavedCostFilterReferent]
    ) {
        self.referents = referents
    }
}

/// `client.savedCostFilters`
public final class SavedCostFiltersNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a saved cost filter
    ///
    /// Names must be unique per organization (case-insensitively) — they are how
    /// the CLI's `--filter <name>` and humans address the filter. A name
    /// collision is a 409.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/saved-cost-filters
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: A live saved filter already uses this name.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: SavedCostFilterInput,
        options: RequestOptions? = nil
    ) async throws -> SavedCostFilter {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/saved-cost-filters",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a saved cost filter
    ///
    /// Soft delete — **refused with a 409 while anything references the filter**,
    /// with the referents in the body. Deleting a referenced filter would
    /// silently widen every referent's scope to all spend; for a budget that can
    /// fire or suppress alerts, so detaching the referents is a deliberate step,
    /// never a side effect of deletion.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/saved-cost-filters/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Still referenced — the body lists every referent.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/saved-cost-filters/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a saved cost filter
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/saved-cost-filters/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> SavedCostFilter {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/saved-cost-filters/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List saved cost filters
    ///
    /// Named, reusable cost filter sets. Graphs, reports and budgets reference
    /// one **by id** (`savedFilterId` in their configs and in `POST
    /// /costs/query`), and the server resolves the reference at query time — so
    /// editing a saved filter changes every referent at once, and nothing ever
    /// holds a copy.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/saved-cost-filters
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [SavedCostFilter] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/saved-cost-filters",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List a saved filter's referents
    ///
    /// Every budget, cost report and dashboard cost graph referencing this filter
    /// — what an edit will re-scope, and what a delete would be refused over.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/saved-cost-filters/{id}/referents
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func referents(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> SavedCostFiltersReferentsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/saved-cost-filters/{id}/referents",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Update a saved cost filter
    ///
    /// Replaces the filter's name, description and terms. This is the
    /// high-leverage write: every graph, report and budget referencing the filter
    /// runs the new terms on its next query — re-scoping a referenced budget can
    /// change which alerts fire. `GET /{id}/referents` names what a change will
    /// touch.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/saved-cost-filters/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: A live saved filter already uses this name.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: SavedCostFilterInput,
        options: RequestOptions? = nil
    ) async throws -> SavedCostFilter {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/saved-cost-filters/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
