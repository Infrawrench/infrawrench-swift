/*
 * InfrawrenchSDK v1.9.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.9.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.storage`
public final class StorageNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Delete a storage object
    ///
    /// _Requires permission: `storage:write`._
    ///
    /// POST /api/org/{orgId}/storage/delete
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        body: StoragePathRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/storage/delete",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Download one or many objects (zipped if more than one)
    ///
    /// _Requires permission: `storage:read`._
    ///
    /// GET /api/org/{orgId}/v1/storage/download
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
    /// - Parameter keys: JSON-encoded array of object keys, e.g.
    /// `["a.txt","b.txt"]`.
    public func download(
        orgId: String? = nil,
        accountId: String,
        bucket: String,
        keys: String,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/v1/storage/download",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("accountId", accountId), QueryParameter("bucket", bucket), QueryParameter("keys", keys)]
            ),
            options: options
        )
    }

    /// List objects in a bucket / prefix
    ///
    /// _Requires permission: `storage:read`._
    ///
    /// POST /api/org/{orgId}/storage/list
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        body: StorageListRequest,
        options: RequestOptions? = nil
    ) async throws -> [StorageObject] {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/storage/list",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Create a folder marker in a bucket
    ///
    /// _Requires permission: `storage:write`._
    ///
    /// POST /api/org/{orgId}/storage/mkdir
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func mkdir(
        orgId: String? = nil,
        body: StoragePathRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/storage/mkdir",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Upload a file to object storage
    ///
    /// Multipart/form-data. Plugin must implement `uploadStorageObject`.
    ///
    /// _Requires permission: `storage:write`._
    ///
    /// POST /api/org/{orgId}/v1/storage/upload
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
        body: StorageUploadForm,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/v1/storage/upload",
                pathParameters: ["orgId": orgId?.parameterValue],
                multipart: body.multipartFields
            ),
            options: options
        )
    }
}
