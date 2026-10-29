/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What acting on it saves per month; null when the finder has no price (and, for
/// orphans, when the caller lacks `costs:read`, as on `/orphans`).
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct SavingsFindingMoney: Codable, Hashable, Sendable {
    /// Currency units (not cents).
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
