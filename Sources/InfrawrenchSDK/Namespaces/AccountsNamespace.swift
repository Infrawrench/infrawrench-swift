/*
 * InfrawrenchSDK v0.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccountsCreateBody: Codable, Hashable, Sendable {
    public var pluginId: PluginId?
    public var displayName: String
    public var credentials: [String: String]
    /// Optional bastion id to route this account's cloud API traffic through.
    public var bastionId: String?

    public init(
        pluginId: PluginId? = nil,
        displayName: String,
        credentials: [String: String],
        bastionId: String? = nil
    ) {
        self.pluginId = pluginId
        self.displayName = displayName
        self.credentials = credentials
        self.bastionId = bastionId
    }
}

public struct AccountsCredentialsUpdateBody: Codable, Hashable, Sendable {
    /// Complete credentials map. Sensitive fields the caller doesn't want to
    /// change should be re-sent with their previous value (the server doesn't
    /// merge with the existing blob).
    public var credentials: [String: String]

    public init(
        credentials: [String: String]
    ) {
        self.credentials = credentials
    }
}

public struct AccountsCredentialsUpdateResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

/// `client.accounts`
public final class AccountsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.accounts.credentials`
    public let credentials: AccountsCredentialsNamespace
    /// `client.accounts.syncType`
    public let syncType: AccountsSyncTypeNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.credentials = AccountsCredentialsNamespace(transport: transport)
        self.syncType = AccountsSyncTypeNamespace(transport: transport)
    }

    /// Create an account
    ///
    /// Stores encrypted credentials and triggers a first sync. `syncError` is set
    /// if the initial sync failed (the account row is still created).
    ///
    /// _Requires permission: `accounts:write`._
    ///
    /// POST /api/org/{orgId}/accounts
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: AccountsCreateBody,
        options: RequestOptions? = nil
    ) async throws -> CreateAccountResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/accounts",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete an account
    ///
    /// _Requires permission: `accounts:delete`._
    ///
    /// DELETE /api/org/{orgId}/accounts/{id}
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
                path: "/api/org/{orgId}/accounts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Account metadata + resource type list
    ///
    /// _Requires permission: `accounts:read`._
    ///
    /// GET /api/org/{orgId}/accounts/{id}/detail
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func detail(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> AccountDetail {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/accounts/{id}/detail",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List accounts in this organization
    ///
    /// _Requires permission: `accounts:read`._
    ///
    /// GET /api/org/{orgId}/accounts
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [Account] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/accounts",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List installed plugins and their credential fields
    ///
    /// _Requires permission: `accounts:read`._
    ///
    /// GET /api/org/{orgId}/accounts/plugins
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func plugins(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [PluginSummary] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/accounts/plugins",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List cached resources for an account
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/accounts/{id}/resources
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter topLevelOnly: If `true`, only resources with no
    /// `parentResourceId` are returned. One of `true`, `false`.
    public func resources(
        orgId: String? = nil,
        id: String,
        topLevelOnly: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [Resource] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/accounts/{id}/resources",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                query: [QueryParameter("topLevelOnly", topLevelOnly)]
            ),
            options: options
        )
    }

    /// Sync all resource types for an account
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/accounts/{id}/sync
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func sync(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> SyncResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/accounts/{id}/sync",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Update an account (rename and/or change bastion binding)
    ///
    /// _Requires permission: `accounts:write`._
    ///
    /// PATCH /api/org/{orgId}/accounts/{id}
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
        body: UpdateAccountRequest,
        options: RequestOptions? = nil
    ) async throws -> UpdatedAccount {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/accounts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.accounts.credentials`
public final class AccountsCredentialsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Fetch the decrypted credentials for an account
    ///
    /// Returns the credentials map as it was originally submitted. Sensitive —
    /// gate access carefully.
    ///
    /// _Requires permission: `secrets:read`._
    ///
    /// GET /api/org/{orgId}/accounts/{id}/credentials
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> [String: String] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/accounts/{id}/credentials",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Rotate the credentials an account uses to talk to the upstream provider
    ///
    /// Replaces the encrypted credentials blob in place. Used to swap a stale or
    /// narrowly-scoped token for a freshly-minted one without recreating the
    /// account (preserves existing resources, pins, dashboards, sync history).
    ///
    /// _Requires permission: `secrets:write`._
    ///
    /// PUT /api/org/{orgId}/accounts/{id}/credentials
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
        body: AccountsCredentialsUpdateBody,
        options: RequestOptions? = nil
    ) async throws -> AccountsCredentialsUpdateResult {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/accounts/{id}/credentials",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.accounts.syncType`
public final class AccountsSyncTypeNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Sync a single resource type and return its resources
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/accounts/{id}/sync-type/{typeId}
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 500: Server error
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        id: String,
        typeId: ResourceTypeId,
        options: RequestOptions? = nil
    ) async throws -> [SyncedResource] {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/accounts/{id}/sync-type/{typeId}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "typeId": typeId.parameterValue]
            ),
            options: options
        )
    }
}
