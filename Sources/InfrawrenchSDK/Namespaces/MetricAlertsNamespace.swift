/*
 * InfrawrenchSDK v0.44.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.44.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.metricAlerts`
public final class MetricAlertsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a metric alert rule
    ///
    /// Rules select resources by query (plugin + resource type + tag), never by
    /// id list, so a rule automatically covers resources created after it was
    /// written. The poller evaluates enabled rules about once a minute and alerts
    /// when the condition held for the whole trailing window.
    ///
    /// POST /api/org/{orgId}/metric-alerts
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: MetricAlertRuleInput,
        options: RequestOptions? = nil
    ) async throws -> MetricAlertRule {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/metric-alerts",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a metric alert rule
    ///
    /// Soft delete. The rule's firing history stays readable via
    /// /metric-alerts/events.
    ///
    /// DELETE /api/org/{orgId}/metric-alerts/{id}
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
                path: "/api/org/{orgId}/metric-alerts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Recent metric alert firings
    ///
    /// GET /api/org/{orgId}/metric-alerts/events
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func events(
        orgId: String? = nil,
        ruleId: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> [MetricAlertEvent] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/metric-alerts/events",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("ruleId", ruleId), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// Get a metric alert rule
    ///
    /// GET /api/org/{orgId}/metric-alerts/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> MetricAlertRule {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/metric-alerts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List metric alert rules with live firing status
    ///
    /// GET /api/org/{orgId}/metric-alerts
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [MetricAlertRuleWithStatus] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/metric-alerts",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List metric series that actually exist
    ///
    /// The series labels resources reported in the last 7 days, optionally
    /// narrowed to one plugin and resource type — what the rule builder's metric
    /// picker is fed from.
    ///
    /// GET /api/org/{orgId}/metric-alerts/metric-keys
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func metricKeys(
        orgId: String? = nil,
        pluginId: String? = nil,
        resourceTypeId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [MetricSeriesKey] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/metric-alerts/metric-keys",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("pluginId", pluginId), QueryParameter("resourceTypeId", resourceTypeId)]
            ),
            options: options
        )
    }

    /// List what the organization's resources offer to select on
    ///
    /// GET /api/org/{orgId}/metric-alerts/selector-options
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func selectorOptions(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> MetricAlertSelectorOptions {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/metric-alerts/selector-options",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Preview which resources a selector matches right now
    ///
    /// GET /api/org/{orgId}/metric-alerts/selector-preview
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func selectorPreview(
        orgId: String? = nil,
        pluginId: String? = nil,
        resourceTypeId: String? = nil,
        tagKey: String? = nil,
        tagValue: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> MetricAlertSelectorPreview {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/metric-alerts/selector-preview",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("pluginId", pluginId), QueryParameter("resourceTypeId", resourceTypeId), QueryParameter("tagKey", tagKey), QueryParameter("tagValue", tagValue)]
            ),
            options: options
        )
    }

    /// Update a metric alert rule
    ///
    /// PUT /api/org/{orgId}/metric-alerts/{id}
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
        body: MetricAlertRuleInput,
        options: RequestOptions? = nil
    ) async throws -> MetricAlertRule {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/metric-alerts/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
