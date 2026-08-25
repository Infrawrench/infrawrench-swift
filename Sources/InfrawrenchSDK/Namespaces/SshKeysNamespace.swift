/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.sshKeys`
public final class SshKeysNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Generate a new Ed25519 keypair (private key returned once)
    ///
    /// _Requires permission: `ssh-keys:write`._
    ///
    /// POST /api/org/{orgId}/ssh-keys
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: GenerateSshKeyRequest,
        options: RequestOptions? = nil
    ) async throws -> GeneratedSshKey {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ssh-keys",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete an SSH key (owner only)
    ///
    /// _Requires permission: `ssh-keys:write`._
    ///
    /// DELETE /api/org/{orgId}/ssh-keys/{id}
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
                path: "/api/org/{orgId}/ssh-keys/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Import an existing public key
    ///
    /// _Requires permission: `ssh-keys:write`._
    ///
    /// POST /api/org/{orgId}/ssh-keys/import
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func `import`(
        orgId: String? = nil,
        body: ImportSshKeyRequest,
        options: RequestOptions? = nil
    ) async throws -> ImportedSshKey {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ssh-keys/import",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List org SSH keys
    ///
    /// _Requires permission: `ssh-keys:read`._
    ///
    /// GET /api/org/{orgId}/ssh-keys
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [SshKey] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ssh-keys",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Sign an SSH auth challenge with a cloud-held key (the cloud as an SSH
    /// agent)
    ///
    /// Signs one publickey-authentication challenge with a server-generated org
    /// key whose private half never leaves Infrawrench Cloud. Requires the
    /// `resources:execute` permission — producing an auth signature is the same
    /// authority as opening a shell. Imported keys cannot sign (only their public
    /// half is stored). Every call is audited.
    ///
    /// POST /api/org/{orgId}/ssh-keys/{id}/sign
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func sign(
        orgId: String? = nil,
        id: String,
        body: SignSshKeyRequest,
        options: RequestOptions? = nil
    ) async throws -> SignSshKeyResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ssh-keys/{id}/sign",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
