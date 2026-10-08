/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
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
public struct PrCheckEstimateSide: Codable, Hashable, Sendable {
    public var monthlyAmount: Double
    public var currency: String
    public var partial: Bool

    public init(
        monthlyAmount: Double,
        currency: String,
        partial: Bool
    ) {
        self.monthlyAmount = monthlyAmount
        self.currency = currency
        self.partial = partial
    }
}
