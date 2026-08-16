/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Best-effort trailing spend matched from collected per-resource cost rows; null
/// when the provider reports no per-resource cost. The flag itself never depends
/// on billing data.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct OrphanCostAnnotation: Codable, Hashable, Sendable {
    /// Spend over the trailing cost window.
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
