/*
 * InfrawrenchSDK v1.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChangeCostImpactSeries: Codable, Hashable, Sendable {
    /// ISO 4217 code. Currencies are never summed.
    public var currency: String
    public var beforePerDay: Double
    public var afterPerDay: Double
    /// `afterPerDay - beforePerDay`. Positive means the change costs more.
    public var deltaPerDay: Double
    /// Null when the before window spent nothing — there is no percentage.
    public var deltaPercent: Double?
    public var beforeTotal: Double
    public var afterTotal: Double

    public init(
        currency: String,
        beforePerDay: Double,
        afterPerDay: Double,
        deltaPerDay: Double,
        deltaPercent: Double? = nil,
        beforeTotal: Double,
        afterTotal: Double
    ) {
        self.currency = currency
        self.beforePerDay = beforePerDay
        self.afterPerDay = afterPerDay
        self.deltaPerDay = deltaPerDay
        self.deltaPercent = deltaPercent
        self.beforeTotal = beforeTotal
        self.afterTotal = afterTotal
    }
}
