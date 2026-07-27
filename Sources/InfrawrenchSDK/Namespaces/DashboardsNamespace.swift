/*
 * InfrawrenchSDK v0.5.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.5.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DashboardsCreateBody: Codable, Hashable, Sendable {
    public var name: String

    public init(
        name: String
    ) {
        self.name = name
    }
}

public struct DashboardsRenameBody: Codable, Hashable, Sendable {
    public var name: String

    public init(
        name: String
    ) {
        self.name = name
    }
}

/// `client.dashboards`
public final class DashboardsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.dashboards.default`
    public let `default`: DashboardsDefaultNamespace
    /// `client.dashboards.pin`
    public let pin: DashboardsPinNamespace
    /// `client.dashboards.widgets`
    public let widgets: DashboardsWidgetsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.`default` = DashboardsDefaultNamespace(transport: transport)
        self.pin = DashboardsPinNamespace(transport: transport)
        self.widgets = DashboardsWidgetsNamespace(transport: transport)
    }

    /// Create a dashboard
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// POST /api/org/{orgId}/dashboards
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: DashboardsCreateBody,
        options: RequestOptions? = nil
    ) async throws -> DashboardFull {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a dashboard
    ///
    /// Cannot delete the default dashboard.
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// DELETE /api/org/{orgId}/dashboards/{id}
    ///
    /// Raises on 400: Bad request
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
                path: "/api/org/{orgId}/dashboards/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a dashboard with its pins
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/dashboards/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> DashboardWithPins {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/dashboards/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List dashboards
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/dashboards
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [Dashboard] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/dashboards",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Read cached stats/metrics for dashboard cards
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// POST /api/org/{orgId}/dashboards/probe
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func probe(
        orgId: String? = nil,
        body: ProbeRequest,
        options: RequestOptions? = nil
    ) async throws -> [String: ProbeStatus] {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards/probe",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Rename a dashboard
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// POST /api/org/{orgId}/dashboards/{id}/rename
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rename(
        orgId: String? = nil,
        id: String,
        body: DashboardsRenameBody,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards/{id}/rename",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Reorder dashboard cards
    ///
    /// Persists the order of a dashboard's grid. Pass `cards` to order resource
    /// pins, workflow pins, and widgets as one sequence; `resourceIds` orders
    /// resource pins alone.
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// POST /api/org/{orgId}/dashboards/{id}/reorder
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reorder(
        orgId: String? = nil,
        id: String,
        body: ReorderRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards/{id}/reorder",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Unpin a resource
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// POST /api/org/{orgId}/dashboards/unpin
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func unpin(
        orgId: String? = nil,
        body: UnpinRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards/unpin",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Validate workspace tab targets still exist
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// POST /api/org/{orgId}/dashboards/validate-tabs
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func validateTabs(
        orgId: String? = nil,
        body: ValidateTabsRequest,
        options: RequestOptions? = nil
    ) async throws -> ValidateTabsResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards/validate-tabs",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Pin a workflow's metrics to a dashboard
    ///
    /// POST /api/org/{orgId}/dashboards/workflow-pin
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func workflowPin(
        orgId: String? = nil,
        body: WorkflowPinRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards/workflow-pin",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Unpin a workflow from a dashboard
    ///
    /// POST /api/org/{orgId}/dashboards/workflow-unpin
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func workflowUnpin(
        orgId: String? = nil,
        body: WorkflowPinRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards/workflow-unpin",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.dashboards.default`
public final class DashboardsDefaultNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get-or-create the default dashboard with its pins
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/dashboards/default/full
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func full(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DashboardWithPins {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/dashboards/default/full",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.dashboards.pin`
public final class DashboardsPinNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Pin a resource to a dashboard
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// POST /api/org/{orgId}/dashboards/pin
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: PinRequest,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards/pin",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Full enriched pin data + cached probe status
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/dashboards/pin/{pinId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        pinId: String,
        options: RequestOptions? = nil
    ) async throws -> PinFull {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/dashboards/pin/{pinId}",
                pathParameters: ["orgId": orgId?.parameterValue, "pinId": pinId.parameterValue]
            ),
            options: options
        )
    }

    /// Historical metric series for a pinned resource
    ///
    /// Returns per-series metric points between fromMs and toMs. The backend
    /// auto-routes between raw, 1-minute, and 1-hour rollups based on span: ≤2h
    /// raw, ≤7d 1m, >7d 1h.
    ///
    /// GET /api/org/{orgId}/dashboards/pin/{pinId}/range
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func range(
        orgId: String? = nil,
        pinId: String,
        fromMs: Int? = nil,
        toMs: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> PinRangeResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/dashboards/pin/{pinId}/range",
                pathParameters: ["orgId": orgId?.parameterValue, "pinId": pinId.parameterValue],
                query: [QueryParameter("fromMs", fromMs), QueryParameter("toMs", toMs)]
            ),
            options: options
        )
    }
}

/// `client.dashboards.widgets`
public final class DashboardsWidgetsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Add a cost-graph or budget widget to a dashboard
    ///
    /// POST /api/org/{orgId}/dashboards/widgets
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CreateWidgetRequest,
        options: RequestOptions? = nil
    ) async throws -> DashboardWidgetFull {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dashboards/widgets",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Remove a widget from a dashboard
    ///
    /// DELETE /api/org/{orgId}/dashboards/widgets/{widgetId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        widgetId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/dashboards/widgets/{widgetId}",
                pathParameters: ["orgId": orgId?.parameterValue, "widgetId": widgetId.parameterValue]
            ),
            options: options
        )
    }

    /// Update a widget's title, config, or layout
    ///
    /// PATCH /api/org/{orgId}/dashboards/widgets/{widgetId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        widgetId: String,
        body: UpdateWidgetRequest,
        options: RequestOptions? = nil
    ) async throws -> DashboardWidgetFull {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/dashboards/widgets/{widgetId}",
                pathParameters: ["orgId": orgId?.parameterValue, "widgetId": widgetId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
