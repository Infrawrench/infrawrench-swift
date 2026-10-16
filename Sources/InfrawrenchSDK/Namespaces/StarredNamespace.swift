/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct StarredGetResult: Codable, Hashable, Sendable {
    public var items: [StarredItem]

    public init(
        items: [StarredItem]
    ) {
        self.items = items
    }
}

public struct StarredUpdateResult: Codable, Hashable, Sendable {
    public var item: StarredItem

    public init(
        item: StarredItem
    ) {
        self.item = item
    }
}

/// `client.starred`
public final class StarredNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Unstar an object
    ///
    /// Idempotent, and allowed on objects the caller can no longer see.
    ///
    /// DELETE /api/org/{orgId}/starred/{kind}/{objectId}
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        kind: SearchResultKind,
        objectId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/starred/{kind}/{objectId}",
                pathParameters: ["orgId": orgId?.parameterValue, "kind": kind.parameterValue, "objectId": objectId.parameterValue]
            ),
            options: options
        )
    }

    /// List the caller's starred items
    ///
    /// The caller's own stars in this org, most recently starred first, each
    /// resolved fresh to the same shape as a search hit. Stars on objects the
    /// caller can no longer open (deleted, unshared, outside their cost
    /// visibility, or of a kind their role cannot read) are left out rather than
    /// deleted, so they come back if access does.
    ///
    /// GET /api/org/{orgId}/starred
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> StarredGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/starred",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Star an object
    ///
    /// Idempotent. The object must be one the caller could open; anything else is
    /// a 404. A member can star up to 200 items per org (409 beyond that).
    ///
    /// PUT /api/org/{orgId}/starred/{kind}/{objectId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        kind: SearchResultKind,
        objectId: String,
        options: RequestOptions? = nil
    ) async throws -> StarredUpdateResult {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/starred/{kind}/{objectId}",
                pathParameters: ["orgId": orgId?.parameterValue, "kind": kind.parameterValue, "objectId": objectId.parameterValue]
            ),
            options: options
        )
    }
}
