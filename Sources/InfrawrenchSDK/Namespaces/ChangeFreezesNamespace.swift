/*
 * InfrawrenchSDK v1.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.changeFreezes`
public final class ChangeFreezesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Declare a change freeze window
    ///
    /// While the freeze is in effect, destructive actions (resource deletion,
    /// destructive plugin actions, secret-version destroys, deployment rollbacks)
    /// return `423` unless explicitly overridden by a caller with
    /// `freezes:override`.
    ///
    /// _Requires permission: `freezes:write`._
    ///
    /// POST /api/org/{orgId}/change-freezes
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: ChangeFreezeInput,
        options: RequestOptions? = nil
    ) async throws -> ChangeFreeze {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/change-freezes",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a change freeze window
    ///
    /// _Requires permission: `freezes:write`._
    ///
    /// DELETE /api/org/{orgId}/change-freezes/{id}
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
                path: "/api/org/{orgId}/change-freezes/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// End a change freeze now
    ///
    /// _Requires permission: `freezes:write`._
    ///
    /// POST /api/org/{orgId}/change-freezes/{id}/end
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func end(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> ChangeFreeze {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/change-freezes/{id}/end",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List change freeze windows, newest first
    ///
    /// _Requires permission: `freezes:read`._
    ///
    /// GET /api/org/{orgId}/change-freezes
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [ChangeFreeze] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/change-freezes",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// The freeze currently in effect, if any
    ///
    /// Returns the active freeze window (active, started, not yet past its end
    /// time) or `freeze: null`. Clients poll this to show the freeze banner and
    /// pre-warn before destructive actions.
    ///
    /// _Requires permission: `freezes:read`._
    ///
    /// GET /api/org/{orgId}/change-freezes/status
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func status(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ChangeFreezeStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/change-freezes/status",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a change freeze window
    ///
    /// _Requires permission: `freezes:write`._
    ///
    /// PUT /api/org/{orgId}/change-freezes/{id}
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
        body: ChangeFreezeInput,
        options: RequestOptions? = nil
    ) async throws -> ChangeFreeze {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/change-freezes/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
