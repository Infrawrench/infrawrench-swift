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

public struct CostReportAnomalyAlert: Codable, Hashable, Sendable {
    /// Off keeps the configuration but stops evaluation.
    public var enabled: Bool
    /// Standard deviations above the trailing 28-day mean that count as
    /// anomalous, 1 to 10. The org-wide default is 3.
    public var sigmas: Double
    /// Least rise over the trailing mean, in cents of the spend's own currency,
    /// before a day is reported however many standard deviations it is. 100 to
    /// 10,000,000.
    public var minDeltaCents: Int
    /// Where findings go, in the alert routing vocabulary (`GET
    /// …/anomaly-alert/targets` lists what is available). Delivered as given:
    /// organization alert rules neither redirect, swallow nor hold them for quiet
    /// hours. At least one when `enabled`.
    public var destinations: [AlertDestination]
    public var id: String
    public var reportId: String
    public var reportName: String
    public var createdAt: String
    public var updatedAt: String
    public var lastEvaluatedAt: String?
    public var lastError: String?
    /// The latest 20 findings, newest first.
    public var recent: [CostReportAnomaly]

    public init(
        enabled: Bool,
        sigmas: Double,
        minDeltaCents: Int,
        destinations: [AlertDestination],
        id: String,
        reportId: String,
        reportName: String,
        createdAt: String,
        updatedAt: String,
        lastEvaluatedAt: String? = nil,
        lastError: String? = nil,
        recent: [CostReportAnomaly]
    ) {
        self.enabled = enabled
        self.sigmas = sigmas
        self.minDeltaCents = minDeltaCents
        self.destinations = destinations
        self.id = id
        self.reportId = reportId
        self.reportName = reportName
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.lastEvaluatedAt = lastEvaluatedAt
        self.lastError = lastError
        self.recent = recent
    }
}
