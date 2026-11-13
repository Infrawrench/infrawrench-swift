/*
 * InfrawrenchSDK v1.106.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.106.0).
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
    public var rate: String
    public var effectiveFrom: String
    /// Omitted or `null` for open-ended. Must not be before `effectiveFrom`.
    public var effectiveTo: String?

    public init(
        fromCurrency: String,
        toCurrency: String,
        rate: String,
        effectiveFrom: String,
        effectiveTo: String? = nil
    ) {
        self.fromCurrency = fromCurrency
        self.toCurrency = toCurrency
        self.rate = rate
        self.effectiveFrom = effectiveFrom
        self.effectiveTo = effectiveTo
    }
}
