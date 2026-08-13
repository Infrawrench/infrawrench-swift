/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.logWorkspaces`
public final class LogWorkspacesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Save a log workspace query
    ///
    /// Save a named multi-resource tail: up to 8 log streams plus a search
    /// expression, so the workspace can be reopened. With `alertEnabled` the
    /// poller evaluates the query every few minutes over a bounded tail window
    /// and notifies (push/Slack/Teams, `logMatchAlerts` trigger) when a line
    /// matches, with a cooldown between alerts. Alerting requires a non-empty
    /// search expression. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/log-workspaces
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: A saved query with this name already exists
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: LogWorkspaceQueryCreate,
        options: RequestOptions? = nil
    ) async throws -> LogWorkspaceQuery {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/log-workspaces",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a saved log query
    ///
    /// Remove the saved query and stop any alerting it carried. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/log-workspaces/{queryId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        queryId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/log-workspaces/{queryId}",
                pathParameters: ["orgId": orgId?.parameterValue, "queryId": queryId.parameterValue]
            ),
            options: options
        )
    }

    /// List saved log queries
    ///
    /// Every saved log-workspace query in the organization: its name, the set of
    /// log streams it tails, the search expression, the alert flag and the alert
    /// pass's last evaluation state. Log text itself is fetched per resource via
    /// `POST /api/org/{orgId}/resources/{pluginId}/{typeId}/logs`.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/log-workspaces
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> LogWorkspaceQueryList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/log-workspaces",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List log-capable resources
    ///
    /// Synced resources whose rendered detail declares the logs capability — the
    /// candidates a log workspace can tail — plus sidecar streams reached through
    /// a peer integration (pods and workloads inside a managed cluster, listed
    /// live from the provider and marked with `parentResourceId`). Discovered
    /// from the plugin contract (never a hardcoded provider list), capped at 500
    /// results.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/log-workspaces/resources
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func resources(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> LogCapableResourceList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/log-workspaces/resources",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a saved log query
    ///
    /// Edit the name, resource set, search expression and/or the alert toggle.
    /// Changing the search or the resources resets the alert pass's evaluation
    /// state; turning the alert on makes the query due for evaluation
    /// immediately. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/log-workspaces/{queryId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: A saved query with this name already exists
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        queryId: String,
        body: LogWorkspaceQueryUpdate,
        options: RequestOptions? = nil
    ) async throws -> LogWorkspaceQuery {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/log-workspaces/{queryId}",
                pathParameters: ["orgId": orgId?.parameterValue, "queryId": queryId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
