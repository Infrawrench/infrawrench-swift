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

/// `client.savingsViews`
public final class SavingsViewsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a savings view
    ///
    /// Names are unique per organization, case-insensitively.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/savings-views
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: A live savings view already uses this name.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: SavingsViewInput,
        options: RequestOptions? = nil
    ) async throws -> SavingsView {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/savings-views",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a savings view
    ///
    /// Soft delete. Needs owner on the view (or editor when nobody owns it).
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/savings-views/{id}
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
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
                path: "/api/org/{orgId}/savings-views/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a savings view
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/savings-views/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> SavingsView {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/savings-views/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List savings views
    ///
    /// Saved views over the savings findings list: a status tab, a filter and a
    /// sort. Narrowed by per-object sharing (`savings_view`); the creator owns a
    /// view.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/savings-views
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [SavingsView] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/savings-views",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a savings view
    ///
    /// Full replace. Needs editor on the view.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/savings-views/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: A live savings view already uses this name.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: SavingsViewInput,
        options: RequestOptions? = nil
    ) async throws -> SavingsView {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/savings-views/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
