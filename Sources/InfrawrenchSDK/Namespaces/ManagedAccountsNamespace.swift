/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.managedAccounts`
public final class ManagedAccountsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a managed account
    ///
    /// Refused with 409 when a cost centre or account named here is already
    /// billed to another customer. The error names the other customer, because
    /// “it conflicts” without saying with whom sends the caller hunting.
    ///
    /// _Requires permission: `invoices:write`._
    ///
    /// POST /api/org/{orgId}/managed-accounts
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: ManagedAccountInput,
        options: RequestOptions? = nil
    ) async throws -> ManagedAccount {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/managed-accounts",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Retire a managed account
    ///
    /// A soft delete: an issued invoice names its customer, and an invoice whose
    /// customer stopped resolving is exactly the unreconcilable document this
    /// feature exists to prevent. Draft invoices are removed with it — a draft
    /// was never issued.
    ///
    /// _Requires permission: `invoices:write`._
    ///
    /// DELETE /api/org/{orgId}/managed-accounts/{id}
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
                path: "/api/org/{orgId}/managed-accounts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a managed account
    ///
    /// _Requires permission: `invoices:read`._
    ///
    /// GET /api/org/{orgId}/managed-accounts/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> ManagedAccount {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/managed-accounts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List managed accounts
    ///
    /// The customers a managed service provider bills. A managed account
    /// references existing cost centres rather than defining its own matching
    /// rules, so the spend on an invoice is the same spend the showback report
    /// attributes to those centres.
    ///
    /// _Requires permission: `invoices:read`._
    ///
    /// GET /api/org/{orgId}/managed-accounts
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [ManagedAccount] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/managed-accounts",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a managed account
    ///
    /// A full replace. Editing the scope changes what **future** drafts are drawn
    /// over and nothing else: every approved invoice holds its own copy of the
    /// scope, so moving a cost centre between customers cannot re-bill a period
    /// that has already been invoiced.
    ///
    /// _Requires permission: `invoices:write`._
    ///
    /// PUT /api/org/{orgId}/managed-accounts/{id}
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
        body: ManagedAccountInput,
        options: RequestOptions? = nil
    ) async throws -> ManagedAccount {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/managed-accounts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
