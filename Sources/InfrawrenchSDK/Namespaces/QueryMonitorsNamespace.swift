/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.queryMonitors`
public final class QueryMonitorsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.queryMonitors.get`
    public let get: QueryMonitorsGetNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = QueryMonitorsGetNamespace(transport: transport)
    }

    /// Create a query monitor
    ///
    /// A monitor may only run `select`, `with`, `show` or `explain`, and only a
    /// **single** statement. That is a deliberate allowlist of leading keywords
    /// rather than a denylist of dangerous ones: a denylist has to be right about
    /// every dialect's spelling of every destructive verb, forever, and only has
    /// to be wrong once. Comments are stripped before the check, so `--
    /// harmless\nDROP TABLE x` is rejected, and `SELECT 1; DROP TABLE x` is
    /// rejected by the single-statement rule.
    ///
    /// Takes `resources:execute`, like the SQL editor: saving a monitor arranges
    /// for a query to run against a customer database on a schedule, forever,
    /// which is a strictly larger act than running one while watching it.
    ///
    /// POST /api/org/{orgId}/query-monitors
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: QueryMonitorCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> QueryMonitor {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/query-monitors",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a query monitor
    ///
    /// DELETE /api/org/{orgId}/query-monitors/{monitorId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        monitorId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/query-monitors/{monitorId}",
                pathParameters: ["orgId": orgId?.parameterValue, "monitorId": monitorId.parameterValue]
            ),
            options: options
        )
    }

    /// Run a query once without saving it
    ///
    /// The editor's 'try it' button. Goes through the same read-only guard as a
    /// scheduled run — a query that could not be saved as a monitor must not be
    /// runnable through the monitor's own preview — and applies the threshold, so
    /// the answer says whether it *would* be breaching rather than leaving the
    /// reader to compare two numbers.
    ///
    /// POST /api/org/{orgId}/query-monitors/test
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func test(
        orgId: String? = nil,
        body: QueryMonitorCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> QueryMonitorTestResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/query-monitors/test",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Edit a query monitor
    ///
    /// Omitted fields are left alone and the result is validated after merging.
    /// Changing the query, the mode, the operator or the threshold **re-arms**
    /// the monitor: the stored breach streak was accumulated against a different
    /// question, and carrying it forward would fire an alert on the first run of
    /// a rule nobody has tested.
    ///
    /// PATCH /api/org/{orgId}/query-monitors/{monitorId}
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
        monitorId: String,
        body: QueryMonitorUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> QueryMonitor {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/query-monitors/{monitorId}",
                pathParameters: ["orgId": orgId?.parameterValue, "monitorId": monitorId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.queryMonitors.get`
public final class QueryMonitorsGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List query monitors
    ///
    /// GET /api/org/{orgId}/query-monitors
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> QueryMonitorList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/query-monitors",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get one query monitor
    ///
    /// GET /api/org/{orgId}/query-monitors/{monitorId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdQueryMonitorsMonitorId(
        orgId: String? = nil,
        monitorId: String,
        options: RequestOptions? = nil
    ) async throws -> QueryMonitor {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/query-monitors/{monitorId}",
                pathParameters: ["orgId": orgId?.parameterValue, "monitorId": monitorId.parameterValue]
            ),
            options: options
        )
    }
}
