/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.ownership`
public final class OwnershipNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Clear a resource's ownership
    ///
    /// Removes the ownership record. The resource itself is untouched.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/ownership
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        resourceId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ownership",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId)]
            ),
            options: options
        )
    }

    /// List resource ownership records
    ///
    /// Every ownership record in the organization — owner, purpose and
    /// authorizing ticket, per resource. Only resources somebody has recorded
    /// something about appear; an absent record means the resource is unowned.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/ownership
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceOwnershipListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ownership",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List people an owner can be set to
    ///
    /// Org members, as a minimal id/name/email projection for the owner picker.
    /// Requires only `resources:read`, deliberately not `team:read`: recording
    /// who owns a resource must not be reserved for whoever can also read roles
    /// and membership.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/ownership/members
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func members(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OwnerCandidateListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ownership/members",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get one resource's ownership
    ///
    /// The ownership record for a single resource, or null when none is recorded.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/ownership/resource
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func resource(
        orgId: String? = nil,
        resourceId: String,
        options: RequestOptions? = nil
    ) async throws -> ResourceOwnershipEnvelope {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ownership/resource",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId)]
            ),
            options: options
        )
    }

    /// Set a resource's ownership
    ///
    /// Upsert keyed by `resourceId` — ownership is a property of the resource, so
    /// there is no separate create and update. Omitted fields keep their value
    /// and `null` clears one. Clearing every field removes the record entirely
    /// and the response is `null`, which is the new truth rather than an empty
    /// record. An `ownerUserId` must be a member of this organization: ownership
    /// that looks routable but reaches nobody is worse than none.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/ownership
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: ResourceOwnershipPatch? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceOwnership? {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ownership",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
