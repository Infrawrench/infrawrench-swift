/*
 * InfrawrenchSDK v1.67.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.67.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CustomCostSourcesUploadsRowsBody: Codable, Hashable, Sendable {
    public var rows: [CustomCostRow]

    public init(
        rows: [CustomCostRow]
    ) {
        self.rows = rows
    }
}

public struct CustomCostSourcesUploadsRowsResult: Codable, Hashable, Sendable {
    public var written: Int

    public init(
        written: Int
    ) {
        self.written = written
    }
}

/// `client.customCostSources`
public final class CustomCostSourcesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.customCostSources.uploads`
    public let uploads: CustomCostSourcesUploadsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.uploads = CustomCostSourcesUploadsNamespace(transport: transport)
    }

    /// Create a custom cost source
    ///
    /// A named provider for spend Infrawrench has no plugin for. Fill it by
    /// uploading files (CSV or FOCUS) from Settings, `infrawrench costs push
    /// --format csv|focus`, or the upload endpoints below.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/custom-cost-sources
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CustomCostSourceInput,
        options: RequestOptions? = nil
    ) async throws -> CustomCostSource {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/custom-cost-sources",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a custom cost source and all of its spend
    ///
    /// Zeroes every cost row the source holds, then deletes it with its upload
    /// history. The spend disappears from every report, budget and export.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/custom-cost-sources/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CustomCostDeleted {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/custom-cost-sources/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a custom cost source
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/custom-cost-sources/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CustomCostSource {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/custom-cost-sources/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List custom cost sources
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/custom-cost-sources
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CustomCostSource] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/custom-cost-sources",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a custom cost source
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/custom-cost-sources/{id}
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
        body: CustomCostSourceInput,
        options: RequestOptions? = nil
    ) async throws -> CustomCostSource {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/custom-cost-sources/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.customCostSources.uploads`
public final class CustomCostSourcesUploadsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Finish an upload
    ///
    /// Applies `replace` (zeroing this source's rows from other uploads in the
    /// range) and records what the upload holds.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/custom-cost-sources/{id}/uploads/{uploadId}/complete
    ///
    /// Raises on 400: Already complete
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func complete(
        orgId: String? = nil,
        id: String,
        uploadId: String,
        options: RequestOptions? = nil
    ) async throws -> CustomCostUpload {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/custom-cost-sources/{id}/uploads/{uploadId}/complete",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "uploadId": uploadId.parameterValue]
            ),
            options: options
        )
    }

    /// Start an upload
    ///
    /// Declares the upload's date range and what happens to spend already held in
    /// it. Then send rows with `…/rows` (up to 5,000 per call) and finish with
    /// `…/complete`.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/custom-cost-sources/{id}/uploads
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The range overlaps earlier uploads and no `mode` was given
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        id: String,
        body: CustomCostUploadCreate,
        options: RequestOptions? = nil
    ) async throws -> CustomCostUpload {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/custom-cost-sources/{id}/uploads",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete an upload and the rows it wrote
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/custom-cost-sources/{id}/uploads/{uploadId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        uploadId: String,
        options: RequestOptions? = nil
    ) async throws -> CustomCostDeleted {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/custom-cost-sources/{id}/uploads/{uploadId}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "uploadId": uploadId.parameterValue]
            ),
            options: options
        )
    }

    /// List a source's uploads
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/custom-cost-sources/{id}/uploads
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> [CustomCostUpload] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/custom-cost-sources/{id}/uploads",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Send a chunk of rows to an open upload
    ///
    /// The chunk is validated whole: a 400 means none of it was written.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/custom-cost-sources/{id}/uploads/{uploadId}/rows
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rows(
        orgId: String? = nil,
        id: String,
        uploadId: String,
        body: CustomCostSourcesUploadsRowsBody,
        options: RequestOptions? = nil
    ) async throws -> CustomCostSourcesUploadsRowsResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/custom-cost-sources/{id}/uploads/{uploadId}/rows",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "uploadId": uploadId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
