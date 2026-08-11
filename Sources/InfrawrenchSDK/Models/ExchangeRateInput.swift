/*
 * InfrawrenchSDK v1.12.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.12.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExchangeRateInput: Codable, Hashable, Sendable {
    /// ISO 4217 code, upper-case.
    public var fromCurrency: String
    /// ISO 4217 code, upper-case.
    public var toCurrency: String
    /// Multiply an amount in `fromCurrency` by this to get `toCurrency`. A
    /// decimal **string**, not a number: it is stored in a `numeric(20, 10)`
    /// column so the digits your finance system used survive the round trip
    /// exactly, and a JSON number could not promise that.
    public var rate: String
    public var effectiveFrom: String

    public init(
        fromCurrency: String,
        toCurrency: String,
        rate: String,
        effectiveFrom: String
    ) {
        self.fromCurrency = fromCurrency
        self.toCurrency = toCurrency
        self.rate = rate
        self.effectiveFrom = effectiveFrom
    }
}
