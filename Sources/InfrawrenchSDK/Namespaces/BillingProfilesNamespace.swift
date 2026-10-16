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

/// `client.billingProfiles`
public final class BillingProfilesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a billing profile
    ///
    /// _Requires permission: `invoices:write`._
    ///
    /// POST /api/org/{orgId}/billing-profiles
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: BillingProfileInput,
        options: RequestOptions? = nil
    ) async throws -> BillingProfile {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/billing-profiles",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a billing profile
    ///
    /// Refused with 409, naming them, while live customers are assigned: removing
    /// a profile out from under a customer would change the address, tax and
    /// numbering of its next invoice.
    ///
    /// _Requires permission: `invoices:write`._
    ///
    /// DELETE /api/org/{orgId}/billing-profiles/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
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
                path: "/api/org/{orgId}/billing-profiles/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a billing profile
    ///
    /// _Requires permission: `invoices:read`._
    ///
    /// GET /api/org/{orgId}/billing-profiles/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> BillingProfile {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/billing-profiles/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List billing profiles
    ///
    /// _Requires permission: `invoices:read`._
    ///
    /// GET /api/org/{orgId}/billing-profiles
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [BillingProfile] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/billing-profiles",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a billing profile
    ///
    /// A full replace, except `logo`, which is left as saved when absent. Draft
    /// invoices of the assigned customers follow the change; approved invoices
    /// keep the copy frozen onto them.
    ///
    /// _Requires permission: `invoices:write`._
    ///
    /// PUT /api/org/{orgId}/billing-profiles/{id}
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
        id: String,
        body: BillingProfileInput,
        options: RequestOptions? = nil
    ) async throws -> BillingProfile {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/billing-profiles/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
