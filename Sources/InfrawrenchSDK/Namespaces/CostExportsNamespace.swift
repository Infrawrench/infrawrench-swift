/*
 * InfrawrenchSDK v1.58.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.58.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostExportsWarehouseOptionsBody: Codable, Hashable, Sendable {
    public var accountId: String
    public var field: String
    public var target: [String: String]?

    public init(
        accountId: String,
        field: String,
        target: [String: String]? = nil
    ) {
        self.accountId = accountId
        self.field = field
        self.target = target
    }
}

public struct CostExportsWarehouseOptionsResult: Codable, Hashable, Sendable {
    public var options: [CostExportWarehouseOption]

    public init(
        options: [CostExportWarehouseOption]
    ) {
        self.options = options
    }
}

public struct CostExportsWarehouseSetupBody: Codable, Hashable, Sendable {
    public var accountId: String
    public var target: [String: String]?

    public init(
        accountId: String,
        target: [String: String]? = nil
    ) {
        self.accountId = accountId
        self.target = target
    }
}

public struct CostExportsWarehouseSinksResult: Codable, Hashable, Sendable {
    public var sinks: [CostExportWarehouseSink]

    public init(
        sinks: [CostExportWarehouseSink]
    ) {
        self.sinks = sinks
    }
}

/// `client.costExports`
public final class CostExportsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a cost export
    ///
    /// Credentials are required on create for S3 and HTTPS destinations. They are
    /// encrypted at rest and no route ever returns them; responses carry a
    /// redacted `credentialHint` instead. A warehouse destination takes none: it
    /// loads with the connected account's credentials.
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

    /// List options for a warehouse target field
    ///
    /// Reads the provider live with the account's credentials (warehouses,
    /// databases or catalogs, schemas, tables). A provider refusal is a 400
    /// carrying its message.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/cost-exports/warehouse-options
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func warehouseOptions(
        orgId: String? = nil,
        body: CostExportsWarehouseOptionsBody,
        options: RequestOptions? = nil
    ) async throws -> CostExportsWarehouseOptionsResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-exports/warehouse-options",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Least-privilege setup for a warehouse target
    ///
    /// The GRANT statements the connected role or principal needs for a target,
    /// plus any non-SQL steps (for Databricks, CAN USE on the SQL warehouse).
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/cost-exports/warehouse-setup
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func warehouseSetup(
        orgId: String? = nil,
        body: CostExportsWarehouseSetupBody,
        options: RequestOptions? = nil
    ) async throws -> CostExportWarehouseSetup {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-exports/warehouse-setup",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List warehouse destination types
    ///
    /// Plugins that can load an export into a table in their own warehouse
    /// (Snowflake, Databricks), each with the organization's connected accounts
    /// and the target fields to fill.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/cost-exports/warehouse-sinks
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func warehouseSinks(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostExportsWarehouseSinksResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-exports/warehouse-sinks",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
