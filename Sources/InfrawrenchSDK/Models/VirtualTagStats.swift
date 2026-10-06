/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct VirtualTagStats: Codable, Hashable, Sendable {
    public var from: String?
    public var to: String?
    public var currencies: [VirtualTagCurrencyStats]
    /// Days a metric split carried weights forward or split evenly.
    public var metricFallbackDays: Int
    public var distinctValues: Int

    public init(
        from: String? = nil,
        to: String? = nil,
        currencies: [VirtualTagCurrencyStats],
        metricFallbackDays: Int,
        distinctValues: Int
    ) {
        self.from = from
        self.to = to
        self.currencies = currencies
        self.metricFallbackDays = metricFallbackDays
        self.distinctValues = distinctValues
    }
}
