/*
 * InfrawrenchSDK v0.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.bastions`
public final class BastionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Register a new bastion (returns the enrollment token once)
    ///
    /// _Requires permission: `bastions:write`._
    ///
    /// POST /api/org/{orgId}/bastions
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CreateBastionRequest,
        options: RequestOptions? = nil
    ) async throws -> CreateBastionResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/bastions",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Revoke a bastion — accounts referencing it have their bastion binding
    /// cleared
    ///
    /// _Requires permission: `bastions:write`._
    ///
    /// DELETE /api/org/{orgId}/bastions/{id}
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
                path: "/api/org/{orgId}/bastions/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List bastion agents registered to this org
    ///
    /// _Requires permission: `bastions:read`._
    ///
    /// GET /api/org/{orgId}/bastions
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [Bastion] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/bastions",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
