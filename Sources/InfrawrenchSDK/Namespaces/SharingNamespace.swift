/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.sharing`
public final class SharingNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Reset an object's sharing to the default
    ///
    /// Removes every grant and the org-wide setting, so everyone in the
    /// organization can edit again. Owner only. A report's creator remains its
    /// owner.
    ///
    /// DELETE /api/org/{orgId}/sharing/{objectType}/{objectId}
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        objectType: ShareableObjectType,
        objectId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/sharing/{objectType}/{objectId}",
                pathParameters: ["orgId": orgId?.parameterValue, "objectType": objectType.parameterValue, "objectId": objectId.parameterValue]
            ),
            options: options
        )
    }

    /// Get an object's sharing
    ///
    /// Who can open or edit a cost report, report folder or dashboard. Needs
    /// viewer on the object and the family's read permission (`costs:read` /
    /// `dashboards:read`).
    ///
    /// GET /api/org/{orgId}/sharing/{objectType}/{objectId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        objectType: ShareableObjectType,
        objectId: String,
        options: RequestOptions? = nil
    ) async throws -> ObjectSharing {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/sharing/{objectType}/{objectId}",
                pathParameters: ["orgId": orgId?.parameterValue, "objectType": objectType.parameterValue, "objectId": objectId.parameterValue]
            ),
            options: options
        )
    }

    /// Replace an object's sharing
    ///
    /// Replaces the org-wide default and every grant. Owner on the object plus
    /// the family's write permission. At least one owner must remain.
    ///
    /// PUT /api/org/{orgId}/sharing/{objectType}/{objectId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        objectType: ShareableObjectType,
        objectId: String,
        body: ObjectSharingInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> ObjectSharing {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/sharing/{objectType}/{objectId}",
                pathParameters: ["orgId": orgId?.parameterValue, "objectType": objectType.parameterValue, "objectId": objectId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
