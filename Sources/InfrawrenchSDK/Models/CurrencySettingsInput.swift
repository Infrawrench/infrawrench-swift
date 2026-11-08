/*
 * InfrawrenchSDK v1.99.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.99.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CurrencySettingsInput: Codable, Hashable, Sendable {
    public var displayCurrency: JSONValue
    public var autoRates: JSONValue?
    /// Which automatic (feed) rate converts a day's spend. `daily`: the rate
    /// published for that day, carried forward over weekends and holidays.
    /// `month_end`: the rate in force on the last day of that day's month, so a
    /// whole month converts at one rate. Stated rates always apply to the days
    /// their own dates cover, whatever the basis.
    public var rateBasis: JSONValue?

    public init(
        displayCurrency: JSONValue,
        autoRates: JSONValue? = nil,
        rateBasis: JSONValue? = nil
    ) {
        self.displayCurrency = displayCurrency
        self.autoRates = autoRates
        self.rateBasis = rateBasis
    }
}
