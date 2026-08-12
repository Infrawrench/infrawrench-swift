/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.costExports`
public final class CostExportsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a cost export
    ///
    /// Credentials are required on create. They are encrypted at rest and no
    /// route ever returns them; responses carry a redacted `credentialHint`
    /// instead.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/cost-exports
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CostExportInput,
        options: RequestOptions? = nil
    ) async throws -> CostExport {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-exports",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a cost export
    ///
    /// Soft delete. Objects already written to the destination are left alone.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-exports/{id}
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
                path: "/api/org/{orgId}/cost-exports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a cost export
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-exports/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostExport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-exports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List scheduled cost exports
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-exports
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CostExport] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-exports",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Run a cost export now
    ///
    /// Runs the export immediately against the same code path the poller uses,
    /// writing every period in the restatement window. Answers 200 with `status:
    /// "failed"` and a message rather than an error status when the destination
    /// rejects the write — the caller wants the reason, and the same failure is
    /// recorded on the export.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/cost-exports/{id}/run
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func run(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostExportRunResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-exports/{id}/run",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Update a cost export
    ///
    /// Replaces everything but the credential. Omit
    /// `accessKeyId`/`secretAccessKey`/`url` to keep the stored credential;
    /// changing the destination type requires supplying a new one. Saving
    /// reschedules the export from now.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/cost-exports/{id}
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
        body: CostExportInput,
        options: RequestOptions? = nil
    ) async throws -> CostExport {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-exports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
