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

public struct CostReportAnomaly: Codable, Hashable, Sendable {
    public var id: String
    /// The anomalous day, YYYY-MM-DD (UTC).
    public var day: String
    public var currency: String
    /// That day's spend in the report's scope.
    public var actual: Double
    /// The trailing 28-day mean it was judged against.
    public var baseline: Double
    /// The bar it cleared: mean + sigmas x stddev.
    public var threshold: Double
    /// When it was delivered; null while undelivered or inside the 7-day
    /// cooldown.
    public var notifiedAt: String?
    public var createdAt: String

    public init(
        id: String,
        day: String,
        currency: String,
        actual: Double,
        baseline: Double,
        threshold: Double,
        notifiedAt: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.day = day
        self.currency = currency
        self.actual = actual
        self.baseline = baseline
        self.threshold = threshold
        self.notifiedAt = notifiedAt
        self.createdAt = createdAt
    }
}
