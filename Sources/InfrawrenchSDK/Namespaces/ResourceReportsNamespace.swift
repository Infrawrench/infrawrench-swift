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

public struct ResourceReportsTagValuesResult: Codable, Hashable, Sendable {
    public var values: [String]

    public init(
        values: [String]
    ) {
        self.values = values
    }
}

public struct ResourceReportsCsvCreateBody: Codable, Hashable, Sendable {
    public var config: ResourceReportConfig
    public var name: String?

    public init(
        config: ResourceReportConfig,
        name: String? = nil
    ) {
        self.config = config
        self.name = name
    }
}

/// `client.resourceReports`
public final class ResourceReportsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.resourceReports.csv`
    public let csv: ResourceReportsCsvNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.csv = ResourceReportsCsvNamespace(transport: transport)
    }

    /// Create a resource report
    ///
    /// The creator is the report's implicit owner for sharing. Filing it in a
    /// folder needs editor access to the folder. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/resource-reports
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: ResourceReportInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceReport {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resource-reports",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a resource report
    ///
    /// Soft delete; its sharing goes with it. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/resource-reports/{id}
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
                path: "/api/org/{orgId}/resource-reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List report folders for resource reports
    ///
    /// The report folders the caller can see. Resource reports share the folder
    /// tree cost reports use; create and rename folders through
    /// `/cost-report-folders`.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/resource-reports/folders
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func folders(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CostReportFolder] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resource-reports/folders",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Read a resource report
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/resource-reports/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> ResourceReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resource-reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List resource reports
    ///
    /// The saved inventory reports the caller's sharing lets them open, by name.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/resource-reports
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [ResourceReport] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resource-reports",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// What a resource report can filter and show
    ///
    /// Providers, accounts, resource types, regions and statuses with resource
    /// counts, the metadata fields the given types expose (from the type
    /// definitions and the newest synced resources), provider tag keys and, with
    /// `costs:read`, virtual tag keys.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/resource-reports/options
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter types: Comma-separated `pluginId/resourceTypeId` pairs
    /// narrowing `fields`.
    public func options(
        orgId: String? = nil,
        types: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceReportOptions {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resource-reports/options",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("types", types)]
            ),
            options: options
        )
    }

    /// Run an unsaved resource report config
    ///
    /// A read despite the method. Returns one page of rows. Cost and virtual tag
    /// cells need `costs:read` and respect the caller's cost visibility scope.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/resource-reports/query
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func query(
        orgId: String? = nil,
        body: ResourceReportQueryRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceReportRows {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resource-reports/query",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Run a saved resource report
    ///
    /// One page of rows. `sort` and `direction` override the saved sort for this
    /// request only.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/resource-reports/{id}/rows
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter sort: `<kind>:<key>`.
    /// `core:name|type|provider|account|region|status|created|external_id`;
    /// `field:<key>` a key of the resource's synced fields (offered by `GET
    /// /resource-reports/options`); `tag:<key>` a provider tag; `vtag:<key>` a
    /// virtual tag, read from the resource's own cost rows over `costRange` (the
    /// value holding the most spend); `cost:range|mtd|previous_month` spend
    /// joined by provider resource id.
    ///
    /// - Parameter direction: One of `asc`, `desc`.
    public func rows(
        orgId: String? = nil,
        id: String,
        offset: Int? = nil,
        limit: Int? = nil,
        sort: String? = nil,
        direction: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceReportRows {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resource-reports/{id}/rows",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                query: [QueryParameter("offset", offset), QueryParameter("limit", limit), QueryParameter("sort", sort), QueryParameter("direction", direction)]
            ),
            options: options
        )
    }

    /// Values one tag key takes
    ///
    /// Provider tag values from synced resources, or virtual tag values from
    /// spend (empty without `costs:read`), most common first.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/resource-reports/tag-values
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter source: One of `tag`, `virtual_tag`.
    public func tagValues(
        orgId: String? = nil,
        source: String? = nil,
        key: String,
        options: RequestOptions? = nil
    ) async throws -> ResourceReportsTagValuesResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resource-reports/tag-values",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("source", source), QueryParameter("key", key)]
            ),
            options: options
        )
    }

    /// Replace a resource report
    ///
    /// Name, description, config and folder together. Needs editor. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/resource-reports/{id}
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
        body: ResourceReportInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceReport {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/resource-reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.resourceReports.csv`
public final class ResourceReportsCsvNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Export an unsaved resource report config as CSV
    ///
    /// Every matching row up to 50,000, with tag and cost columns (one numeric
    /// column per cost column and currency). A cut file ends with a `# Truncated`
    /// line.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/resource-reports/csv
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: ResourceReportsCsvCreateBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/resource-reports/csv",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Export a saved resource report as CSV
    ///
    /// Every matching row up to 50,000; a cut file ends with a `# Truncated`
    /// line.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/resource-reports/{id}/csv
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/resource-reports/{id}/csv",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}
