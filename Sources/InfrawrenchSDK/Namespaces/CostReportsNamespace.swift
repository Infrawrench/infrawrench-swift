/*
 * InfrawrenchSDK v1.12.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.12.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.costReports`
public final class CostReportsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.costReports.notifications`
    public let notifications: CostReportsNotificationsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.notifications = CostReportsNotificationsNamespace(transport: transport)
    }

    /// Create a cost report
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-reports
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CostReportInput,
        options: RequestOptions? = nil
    ) async throws -> CostReport {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-reports",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a cost report
    ///
    /// Soft delete. Every dashboard card pointing at the report is removed with
    /// it — a card whose report is gone could only ever render as an unavailable
    /// tile.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-reports/{id}
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
                path: "/api/org/{orgId}/cost-reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a cost report
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-reports/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List saved cost reports
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-reports
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CostReport] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-reports",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Run a cost report
    ///
    /// Executes the report's saved config and returns the series, along with the
    /// inclusive window a relative preset resolved to. Takes no body: the report
    /// *is* the query, so a caller never has to reassemble its config to get the
    /// numbers.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/cost-reports/{id}/run
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func run(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostReportRunResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-reports/{id}/run",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Update a cost report
    ///
    /// Replaces the report's name, description, config and folder. Every
    /// dashboard showing the report picks up the new config — that is what
    /// referencing a report by id buys.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-reports/{id}
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
        body: CostReportInput,
        options: RequestOptions? = nil
    ) async throws -> CostReport {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.costReports.notifications`
public final class CostReportsNotificationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a delivery schedule
    ///
    /// On its cadence the server runs the report and sends a composed text
    /// summary — period total (converted to the org's display currency where
    /// configured, with the conversion caveat), change vs the previous period,
    /// top groups, and a deep link. No chart images. An empty result still sends,
    /// saying so.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/cost-reports/{id}/notifications
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        id: String,
        body: ReportNotificationInput,
        options: RequestOptions? = nil
    ) async throws -> ReportNotification {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-reports/{id}/notifications",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a delivery schedule
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-reports/{id}/notifications/{notificationId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        notificationId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/cost-reports/{id}/notifications/{notificationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "notificationId": notificationId.parameterValue]
            ),
            options: options
        )
    }

    /// List a report's delivery schedules
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-reports/{id}/notifications
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> [ReportNotification] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-reports/{id}/notifications",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Send a schedule's report now
    ///
    /// Runs the report and delivers it to this schedule's destinations
    /// immediately, ignoring the schedule and its enabled flag. Fails with a 400
    /// naming the reason when nothing could be delivered. A successful manual
    /// send clears a parked failure — it is the documented recovery for a partial
    /// delivery.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST
    /// /api/org/{orgId}/cost-reports/{id}/notifications/{notificationId}/send
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func send(
        orgId: String? = nil,
        id: String,
        notificationId: String,
        options: RequestOptions? = nil
    ) async throws -> ReportNotificationSendResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-reports/{id}/notifications/{notificationId}/send",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "notificationId": notificationId.parameterValue]
            ),
            options: options
        )
    }

    /// List the destinations a schedule can deliver to
    ///
    /// The org's live Slack channels and Teams webhooks, and whether this
    /// deployment can send mail. Destinations are picked from here — a schedule
    /// can only point at surfaces the org already connected.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/cost-reports/{id}/notifications/targets
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func targets(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> ReportDeliveryTargets {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-reports/{id}/notifications/targets",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Update a delivery schedule
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/cost-reports/{id}/notifications/{notificationId}
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
        notificationId: String,
        body: ReportNotificationInput,
        options: RequestOptions? = nil
    ) async throws -> ReportNotification {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-reports/{id}/notifications/{notificationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "notificationId": notificationId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
