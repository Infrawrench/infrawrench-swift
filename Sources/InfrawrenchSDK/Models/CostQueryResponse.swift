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

public struct CostQueryResponse: Codable, Hashable, Sendable {
    public var series: [CostQuerySeries]
    public var comparison: [CostQuerySeries]?
    /// The **unadjusted trend** projection. Stays the trend even when a scenario
    /// is applied, so a reader can always see what the fit said before anybody's
    /// assumptions touched it.
    public var forecast: [CostSeriesPoint]?
    public var scenario: CostScenarioResult?
    public var currencies: [String]
    /// Period total per currency, and always exactly the sum of `series`.
    /// Fixed-amount billing-rule charges are deliberately **not** folded in here
    /// — they have no series behind them and are reported in
    /// `adjustment.fixedTotals` instead.
    public var totals: [String: Double]
    public var previousTotals: [String: Double]?
    public var adjustment: CostAdjustmentSummary?

    public init(
        series: [CostQuerySeries],
        comparison: [CostQuerySeries]? = nil,
        forecast: [CostSeriesPoint]? = nil,
        scenario: CostScenarioResult? = nil,
        currencies: [String],
        totals: [String: Double],
        previousTotals: [String: Double]? = nil,
        adjustment: CostAdjustmentSummary? = nil
    ) {
        self.series = series
        self.comparison = comparison
        self.forecast = forecast
        self.scenario = scenario
        self.currencies = currencies
        self.totals = totals
        self.previousTotals = previousTotals
        self.adjustment = adjustment
    }
}
