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

public struct CostForecastResult: Codable, Hashable, Sendable {
    public var reportId: String
    public var reportName: String
    public var from: String
    public var to: String
    public var lastObservedDay: String?
    /// Currency of every amount: the org's display currency when it has one.
    public var currency: String?
    public var confidenceLevel: CostForecastConfidenceLevel
    public var baseline: CostForecastSeries
    public var forecast: CostForecastSeries
    public var forecasts: [CostForecastSeries]?

    public init(
        reportId: String,
        reportName: String,
        from: String,
        to: String,
        lastObservedDay: String? = nil,
        currency: String? = nil,
        confidenceLevel: CostForecastConfidenceLevel,
        baseline: CostForecastSeries,
        forecast: CostForecastSeries,
        forecasts: [CostForecastSeries]? = nil
    ) {
        self.reportId = reportId
        self.reportName = reportName
        self.from = from
        self.to = to
        self.lastObservedDay = lastObservedDay
        self.currency = currency
        self.confidenceLevel = confidenceLevel
        self.baseline = baseline
        self.forecast = forecast
        self.forecasts = forecasts
    }
}
