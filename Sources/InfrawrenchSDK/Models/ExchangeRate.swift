/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExchangeRate: Codable, Hashable, Sendable {
    public var id: String
    /// ISO 4217 code, upper-case.
    public var fromCurrency: String
    /// ISO 4217 code, upper-case.
    public var toCurrency: String
    /// Multiply an amount in `fromCurrency` by this to get `toCurrency`. A
    /// decimal **string**, not a number: it is stored in a `numeric(20, 10)`
    /// column so the digits your finance system used survive the round trip
    /// exactly, and a JSON number could not promise that.
    public var rate: String
    /// Inclusive day this rate starts applying. A given day converts at the rate
    /// with the greatest `effectiveFrom` on or before it, so historical periods
    /// keep the rate that applied then. A day earlier than every stated rate has
    /// no rate.
    public var effectiveFrom: String
    public var createdBy: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        fromCurrency: String,
        toCurrency: String,
        rate: String,
        effectiveFrom: String,
        createdBy: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.fromCurrency = fromCurrency
        self.toCurrency = toCurrency
        self.rate = rate
        self.effectiveFrom = effectiveFrom
        self.createdBy = createdBy
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
