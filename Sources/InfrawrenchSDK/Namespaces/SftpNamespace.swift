/*
 * InfrawrenchSDK v0.1.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.1.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.sftp`
public final class SftpNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Delete a file or directory over SFTP
    ///
    /// _Requires permission: `storage:write`._
    ///
    /// POST /api/org/{orgId}/sftp/delete
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 500: Server error
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        body: SftpDeleteRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/sftp/delete",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Download one or many files via SFTP (zipped if more than one)
    ///
    /// _Requires permission: `storage:read`._
    ///
    /// GET /api/org/{orgId}/v1/sftp/download
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 500: Server error
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter paths: JSON-encoded array of remote paths.
    public func download(
        orgId: String? = nil,
        accountId: String,
        paths: String,
        basePath: String? = nil,
        sshKeyId: String? = nil,
        sshHost: String? = nil,
        sshUsername: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/v1/sftp/download",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("accountId", accountId), QueryParameter("paths", paths), QueryParameter("basePath", basePath), QueryParameter("sshKeyId", sshKeyId), QueryParameter("sshHost", sshHost), QueryParameter("sshUsername", sshUsername)]
            ),
            options: options
        )
    }

    /// List a directory over SFTP
    ///
    /// _Requires permission: `storage:read`._
    ///
    /// POST /api/org/{orgId}/sftp/list
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 500: Server error
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        body: SftpListRequest,
        options: RequestOptions? = nil
    ) async throws -> [SftpEntry] {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/sftp/list",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Create a directory over SFTP
    ///
    /// _Requires permission: `storage:write`._
    ///
    /// POST /api/org/{orgId}/sftp/mkdir
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 500: Server error
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func mkdir(
        orgId: String? = nil,
        body: SftpPathRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/sftp/mkdir",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Upload a file via SFTP
    ///
    /// _Requires permission: `storage:write`._
    ///
    /// POST /api/org/{orgId}/v1/sftp/upload
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter body: Sent as `multipart/form-data`.
    public func upload(
        orgId: String? = nil,
        body: SftpUploadForm,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/v1/sftp/upload",
                pathParameters: ["orgId": orgId?.parameterValue],
                multipart: body.multipartFields
            ),
            options: options
        )
    }
}
