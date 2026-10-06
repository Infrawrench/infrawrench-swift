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

/// Monthly amount in the org's display currency (converted at the org's stated
/// rate), or in the native currency when no display currency is configured; null
/// when there is no rate. Sorting and `maxMonthlyPrice` use it.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct PriceCatalogComparable: Codable, Hashable, Sendable {
    public var amount: Double
    public var currency: String

    public init(
        amount: Double,
        currency: String
    ) {
        self.amount = amount
        self.currency = currency
    }
}
