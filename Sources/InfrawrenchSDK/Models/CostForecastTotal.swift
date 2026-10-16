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

public struct CostForecastTotal: Codable, Hashable, Sendable {
    public var expected: Double
    /// Lower bound of the window total. Computed from one fit for the whole
    /// window rather than by summing daily bounds, which would overstate the
    /// uncertainty.
    public var low: Double?
    public var high: Double?

    public init(
        expected: Double,
        low: Double? = nil,
        high: Double? = nil
    ) {
        self.expected = expected
        self.low = low
        self.high = high
    }
}
