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

public struct CostForecastSeriesPoint: Codable, Hashable, Sendable {
    public var bucket: String
    /// The trend's expected amount for the day.
    public var amount: Double
    /// Lower end of the day's prediction interval at `forecastConfidenceLevel`
    /// (the classical least-squares interval, widening with distance from the
    /// data), clamped at zero.
    public var low: Double?
    /// Upper end of the day's prediction interval.
    public var high: Double?

    public init(
        bucket: String,
        amount: Double,
        low: Double? = nil,
        high: Double? = nil
    ) {
        self.bucket = bucket
        self.amount = amount
        self.low = low
        self.high = high
    }
}
