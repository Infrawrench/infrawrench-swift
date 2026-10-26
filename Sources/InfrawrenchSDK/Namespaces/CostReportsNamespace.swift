/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostReportsAnomalyAlertDeleteResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

public struct CostReportsForecastsGetResult: Codable, Hashable, Sendable {
    public var forecasts: [CostForecast]

    public init(
        forecasts: [CostForecast]
    ) {
        self.forecasts = forecasts
    }
}

/// `client.costReports`
public final class CostReportsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.costReports.anomalyAlert`
    public let anomalyAlert: CostReportsAnomalyAlertNamespace
    /// `client.costReports.forecasts`
    public let forecasts: CostReportsForecastsNamespace
    /// `client.costReports.notifications`
    public let notifications: CostReportsNotificationsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.anomalyAlert = CostReportsAnomalyAlertNamespace(transport: transport)
        self.forecasts = CostReportsForecastsNamespace(transport: transport)
        self.notifications = CostReportsNotificationsNamespace(transport: transport)
    }

    /// Move or delete many reports and folders at once
    ///
    /// All or nothing. Every item is checked first: it exists, the caller's
    /// per-object sharing allows the action (editor to move, owner to delete, or
    /// editor when nobody owns it), and for a move, the folder tree that would
    /// result keeps every folder within the three-level nesting limit and free of
    /// cycles. Any problem is a 400 listing each blocking item, and nothing is
    /// written. Deleting a report removes its dashboard cards and pauses its
    /// delivery schedules; deleting a folder drops whatever remains inside it to
    /// the top level. One audit entry is written per item.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-reports/bulk
    ///
    /// Raises on 400: Refused; nothing was changed
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func bulk(
        orgId: String? = nil,
        body: CostReportBulkRequest,
        options: RequestOptions? = nil
    ) async throws -> CostReportBulkResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-reports/bulk",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Create a cost report
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-reports
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
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
    /// it; a card whose report is gone could only ever render as an unavailable
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

    /// Forecasted costs for a report
    ///
    /// Projected daily spend for the report's scope (its filters, saved filter,
    /// cost basis, charge types and billing rules), optionally narrowed to
    /// providers or services, with a low/expected/high band. Returns the
    /// automatic forecast and the requested one (the report's default when none
    /// is named); `all: true` adds every named forecast. Respects the caller's
    /// cost visibility scope. A read despite the method.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/cost-reports/{id}/forecasted-costs
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func forecastedCosts(
        orgId: String? = nil,
        id: String,
        body: CostForecastRunRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostForecastResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-reports/{id}/forecasted-costs",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
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

    /// Export a saved cost report as a PDF
    ///
    /// The report's chart and totals table for its saved window, rendered
    /// server-side and converted to the org's display currency where configured.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-reports/{id}/pdf
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter tz: IANA zone the document's generated-at line is written in,
    /// e.g. `Europe/Berlin`. UTC when absent or unknown.
    public func pdf(
        orgId: String? = nil,
        id: String,
        tz: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-reports/{id}/pdf",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                query: [QueryParameter("tz", tz)]
            ),
            options: options
        )
    }

    /// Run a cost report
    ///
    /// Executes the report's saved config and returns the series, along with the
    /// inclusive window a relative preset resolved to. The body is optional: the
    /// report *is* the query, so a caller never has to reassemble its config to
    /// get the numbers. It may carry one-off display overrides (`measure`,
    /// `usageUnit`, `binning`, `cumulative`, `xAxis`) that apply to this run only
    /// and are never saved; switching a run to `usage` or `count` drops the saved
    /// forecast, scenario and billing rules, which only apply to money.
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
        body: CostReportRunOverrides? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostReportRunResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-reports/{id}/run",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Update a cost report
    ///
    /// Replaces the report's name, description, config and folder. Every
    /// dashboard showing the report picks up the new config; that is what
    /// referencing a report by id buys.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-reports/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
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

/// `client.costReports.anomalyAlert`
public final class CostReportsAnomalyAlertNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Delete a report's anomaly alert
    ///
    /// Removes the alert and its findings. The report itself is untouched.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-reports/{id}/anomaly-alert
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostReportsAnomalyAlertDeleteResult {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/cost-reports/{id}/anomaly-alert",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a report's anomaly alert
    ///
    /// The report's own anomaly alert and its latest findings. The detector
    /// judges the report's filtered daily total (its filters and saved filter,
    /// per currency) against the trailing 28 days after each cost collection,
    /// re-judging the last three days as they fill in, and delivers a day once
    /// (then a 7-day cooldown per currency). 404 when the report has none, or
    /// when the caller cannot see the report.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-reports/{id}/anomaly-alert
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostReportAnomalyAlert {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-reports/{id}/anomaly-alert",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List destinations for a report anomaly alert
    ///
    /// The organization's connected Slack channels, Teams webhooks, live on-call
    /// rotations, members and external-address policy: what the destination
    /// picker offers. Paging provider targets are listed by `GET
    /// /paging-providers/destinations`.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/cost-reports/{id}/anomaly-alert/targets
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func targets(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostReportAnomalyAlertTargets {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-reports/{id}/anomaly-alert/targets",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Create or replace a report's anomaly alert
    ///
    /// One alert per report, replaced whole. Destinations must belong to this
    /// organization (a live Slack channel, a Teams webhook, a current member, an
    /// address the email policy allows). Requires `org:settings:write`, like
    /// report delivery schedules. The alert reads spend with the writer's cost
    /// visibility when they are cost-scoped.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/cost-reports/{id}/anomaly-alert
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
        body: CostReportAnomalyAlertInput,
        options: RequestOptions? = nil
    ) async throws -> CostReportAnomalyAlert {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-reports/{id}/anomaly-alert",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.costReports.forecasts`
public final class CostReportsForecastsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Add a named forecast to a report
    ///
    /// A forecast combines a baseline (the trend, or a driver metric's forecasted
    /// values times the projected unit cost) with scenario models in priority
    /// order. Needs editor access to the report.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/cost-reports/{id}/forecasts
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        id: String,
        body: CostForecastInput,
        options: RequestOptions? = nil
    ) async throws -> CostForecast {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/cost-reports/{id}/forecasts",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a named forecast
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/cost-reports/{id}/forecasts/{forecastId}
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        forecastId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/cost-reports/{id}/forecasts/{forecastId}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "forecastId": forecastId.parameterValue]
            ),
            options: options
        )
    }

    /// List a report's named forecasts
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-reports/{id}/forecasts
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CostReportsForecastsGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-reports/{id}/forecasts",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Replace a named forecast
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/cost-reports/{id}/forecasts/{forecastId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        forecastId: String,
        body: CostForecastInput,
        options: RequestOptions? = nil
    ) async throws -> CostForecast {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/cost-reports/{id}/forecasts/{forecastId}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue, "forecastId": forecastId.parameterValue],
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
    /// summary; period total (converted to the org's display currency where
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
    /// send clears a parked failure; it is the documented recovery for a partial
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
    /// deployment can send mail. Destinations are picked from here; a schedule
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
