/*
 * InfrawrenchSDK v0.7.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.7.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.apiKeys`
public final class ApiKeysNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create an API key (plaintext returned once)
    ///
    /// POST /api/org/{orgId}/api-keys
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CreateApiKeyRequest,
        options: RequestOptions? = nil
    ) async throws -> CreatedApiKey {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/api-keys",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List API keys (no plaintext)
    ///
    /// GET /api/org/{orgId}/api-keys
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [ApiKey] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/api-keys",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Revoke an API key
    ///
    /// POST /api/org/{orgId}/api-keys/{id}/revoke
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func revoke(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/api-keys/{id}/revoke",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Rotate an API key (revokes old, returns new)
    ///
    /// POST /api/org/{orgId}/api-keys/{id}/rotate
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rotate(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CreatedApiKey {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/api-keys/{id}/rotate",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}
