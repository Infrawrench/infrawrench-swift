/*
 * InfrawrenchSDK v0.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostQueryResponse: Codable, Hashable, Sendable {
    public var series: [CostQuerySeries]
    public var comparison: [CostQuerySeries]?
    public var forecast: [CostSeriesPoint]?
    public var currencies: [String]
    public var totals: [String: Double]
    public var previousTotals: [String: Double]?

    public init(
        series: [CostQuerySeries],
        comparison: [CostQuerySeries]? = nil,
        forecast: [CostSeriesPoint]? = nil,
        currencies: [String],
        totals: [String: Double],
        previousTotals: [String: Double]? = nil
    ) {
        self.series = series
        self.comparison = comparison
        self.forecast = forecast
        self.currencies = currencies
        self.totals = totals
        self.previousTotals = previousTotals
    }
}
