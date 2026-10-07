/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct VirtualTagCurrencyStats: Codable, Hashable, Sendable {
    public struct TopValue: Codable, Hashable, Sendable {
        public var value: String
        public var amount: Double

        public init(
            value: String,
            amount: Double
        ) {
            self.value = value
            self.amount = amount
        }
    }

    public var currency: String
    public var total: Double
    /// Spend no rule matched.
    public var unmatched: Double
    /// Spend each rule claimed, in rule order.
    public var byRule: [Double]
    public var topValues: [TopValue]

    public init(
        currency: String,
        total: Double,
        unmatched: Double,
        byRule: [Double],
        topValues: [TopValue]
    ) {
        self.currency = currency
        self.total = total
        self.unmatched = unmatched
        self.byRule = byRule
        self.topValues = topValues
    }
}
