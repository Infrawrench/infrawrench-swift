/*
 * InfrawrenchSDK v1.107.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.107.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `collected + adjustment === adjusted` holds for every currency. That identity
/// is what makes an invoice reconcilable back to the spend that produced it, and
/// it is checked before anything is frozen.
public struct InvoiceTotals: Codable, Hashable, Sendable {
    /// Currency code → amount in the currency's major unit.
    public var collected: [String: Double]
    /// Currency code → amount in the currency's major unit.
    public var adjustment: [String: Double]
    /// Currency code → amount in the currency's major unit.
    public var adjusted: [String: Double]
    /// Keyed by the invoice currency, plus any currency that could not be
    /// converted; which keeps its own key so the total is never quietly short.
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
