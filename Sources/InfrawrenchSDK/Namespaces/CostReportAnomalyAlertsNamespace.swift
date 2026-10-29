/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostReportAnomalyAlertsGetResult: Codable, Hashable, Sendable {
    public var alerts: [CostReportAnomalyAlert]

    public init(
        alerts: [CostReportAnomalyAlert]
    ) {
        self.alerts = alerts
    }
}

/// `client.costReportAnomalyAlerts`
public final class CostReportAnomalyAlertsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List report anomaly alerts
    ///
    /// Every report anomaly alert in the organization whose report the caller can
    /// see, in report name order, each with its latest findings.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/cost-report-anomaly-alerts
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostReportAnomalyAlertsGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/cost-report-anomaly-alerts",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
