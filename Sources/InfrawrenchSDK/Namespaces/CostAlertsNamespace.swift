/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAlertsEventsResult: Codable, Hashable, Sendable {
    public var events: [CostAlertEvent]

    public init(
        events: [CostAlertEvent]
    ) {
        self.events = events
    }
}

public struct CostAlertsGetGetResult: Codable, Hashable, Sendable {
    public var alerts: [CostAlert]

    public init(
        alerts: [CostAlert]
    ) {
        self.alerts = alerts
    }
}

/// `client.costAlerts`
public final class CostAlertsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.costAlerts.get`
    public let get: CostAlertsGetNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = CostAlertsGetNamespace(transport: transport)
    }

    /// Create a change-based cost alert
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-alerts
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CostAlertInput,
        options: RequestOptions? = nil
    ) async throws -> CostAlert {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-alerts",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a cost alert
    ///
    /// Soft delete. Fired events disappear from the org-wide event feed with it.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-alerts/{id}
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
                path: "/api/org/{orgId}/cost-alerts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List recently fired cost-alert events
    ///
    /// Newest first. Optionally scoped to one alert with ?alertId=; an unknown
    /// alertId is a 404, distinct from an alert that simply has no events yet.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-alerts/events
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func events(
        orgId: String? = nil,
        alertId: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostAlertsEventsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-alerts/events",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("alertId", alertId), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// Update a cost alert
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-alerts/{id}
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
        body: CostAlertInput,
        options: RequestOptions? = nil
    ) async throws -> CostAlert {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-alerts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.costAlerts.get`
public final class CostAlertsGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List change-based cost alerts
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-alerts
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostAlertsGetGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-alerts",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get a cost alert
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-alerts/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdCostAlertsId(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostAlert {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-alerts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}
