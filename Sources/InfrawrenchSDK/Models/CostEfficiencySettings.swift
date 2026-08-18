/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostEfficiencySettings: Codable, Hashable, Sendable {
    /// Whether commitments approaching their term end raise alerts. Defaults to
    /// true.
    public var commitmentExpiryEnabled: Bool
    /// Days of notice, each firing at most once per commitment per term end.
    /// Defaults to [60, 30, 7]. A commitment fires at the *smallest* horizon it
    /// has reached, so an account connected 30 days before a term ends gets one
    /// alert, not two.
    public var commitmentExpiryHorizonDays: [Int]
    /// Whether a commitment that lapsed without any horizon warning having fired
    /// raises one alert anyway. Defaults to true, and bounded to terms that ended
    /// within the last 90 days — connecting an account with years of dead
    /// reservations produces one pass of recent news, not an archive.
    public var commitmentExpiryAlertOnExpired: Bool
    /// Whether under-used commitments raise alerts. Defaults to true.
    public var commitmentIdleEnabled: Bool
    /// Utilization percent the whole window must stay under. Defaults to 70 —
    /// roughly where a 1-year no-upfront commitment stops beating on-demand for
    /// the usage it covers.
    public var commitmentIdleThresholdPercent: Int
    /// Trailing days utilization is aggregated over. Defaults to 30. Aggregated,
    /// never sampled per day: a weekday-only workload reads about 71% over a
    /// month and does not fire, which is the point.
    public var commitmentIdleWindowDays: Int
    /// Window days that must carry cost data before anything is judged. Defaults
    /// to 14. A commitment whose utilization cannot be measured at all — a
    /// unit-denominated GCP CUD, or an account whose plugin reports no commitment
    /// attribution — never alerts, regardless of this value.
    public var commitmentIdleMinMeasuredDays: Int
    /// Least wasted money (obligation − delivered) before alerting, in USD cents,
    /// restated per currency. Defaults to 5000 ($50).
    public var commitmentIdleMinWasteCents: Int
    /// Whether rising cost per business-metric unit raises alerts. Defaults to
    /// true.
    public var unitCostRegressionEnabled: Bool
    /// Percent the unit cost must rise versus the prior window. Defaults to 20.
    public var unitCostThresholdPercent: Int
    /// Length of each of the two compared windows. Defaults to 14 — two whole
    /// weekly cycles a side, so a weekday-shaped unit cost compares like with
    /// like.
    public var unitCostWindowDays: Int
    /// Days inside **each** window that must carry a reported, positive metric
    /// value. Defaults to 10. A day with no reported value is a gap and
    /// contributes to neither the numerator nor the denominator; a window that
    /// fails this bar produces no comparison at all rather than a comparison
    /// against a gap.
    public var unitCostMinReportedDays: Int
    /// Least spend in the current window before alerting, in USD cents, restated
    /// per currency. Defaults to 10000 ($100).
    public var unitCostMinSpendCents: Int

    public init(
        commitmentExpiryEnabled: Bool,
        commitmentExpiryHorizonDays: [Int],
        commitmentExpiryAlertOnExpired: Bool,
        commitmentIdleEnabled: Bool,
        commitmentIdleThresholdPercent: Int,
        commitmentIdleWindowDays: Int,
        commitmentIdleMinMeasuredDays: Int,
        commitmentIdleMinWasteCents: Int,
        unitCostRegressionEnabled: Bool,
        unitCostThresholdPercent: Int,
        unitCostWindowDays: Int,
        unitCostMinReportedDays: Int,
        unitCostMinSpendCents: Int
    ) {
        self.commitmentExpiryEnabled = commitmentExpiryEnabled
        self.commitmentExpiryHorizonDays = commitmentExpiryHorizonDays
        self.commitmentExpiryAlertOnExpired = commitmentExpiryAlertOnExpired
        self.commitmentIdleEnabled = commitmentIdleEnabled
        self.commitmentIdleThresholdPercent = commitmentIdleThresholdPercent
        self.commitmentIdleWindowDays = commitmentIdleWindowDays
        self.commitmentIdleMinMeasuredDays = commitmentIdleMinMeasuredDays
        self.commitmentIdleMinWasteCents = commitmentIdleMinWasteCents
        self.unitCostRegressionEnabled = unitCostRegressionEnabled
        self.unitCostThresholdPercent = unitCostThresholdPercent
        self.unitCostWindowDays = unitCostWindowDays
        self.unitCostMinReportedDays = unitCostMinReportedDays
        self.unitCostMinSpendCents = unitCostMinSpendCents
    }
}
