/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// **Null for a draft** — null, not zero. A draft's figures are recomputed on
/// read and the list does not recompute; fetch the invoice by id for a draft's
/// current numbers.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct InvoiceTotals: Codable, Hashable, Sendable {
    /// Currency code → amount in the currency's major unit.
    public var collected: [String: Double]
    /// Currency code → amount in the currency's major unit.
    public var adjustment: [String: Double]
    /// Currency code → amount in the currency's major unit.
    public var adjusted: [String: Double]
    /// Keyed by the invoice currency, plus any currency that could not be
    /// converted — which keeps its own key so the total is never quietly short.
    public var billed: [String: Double]

    public init(
        collected: [String: Double],
        adjustment: [String: Double],
        adjusted: [String: Double],
        billed: [String: Double]
    ) {
        self.collected = collected
        self.adjustment = adjustment
        self.adjusted = adjusted
        self.billed = billed
    }
}
