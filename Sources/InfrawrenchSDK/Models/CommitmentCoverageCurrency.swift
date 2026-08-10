/*
 * InfrawrenchSDK v1.7.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.7.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentCoverageCurrency: Codable, Hashable, Sendable {
    public var currency: String
    /// Usage spend on rows stamped with a commitment id.
    public var coveredAmount: Double
    public var uncoveredAmount: Double
    /// Uncovered usage in cells where a commitment landed in the window —
    /// provider evidence of committability, not a hand-maintained service table.
    public var uncoveredEligibleAmount: Double
    /// Lower bound: covered ÷ (covered + all uncovered usage).
    public var broadRatio: Double?
    /// Upper bound: covered ÷ (covered + uncovered usage in eligible cells).
    public var narrowRatio: Double?

    public init(
        currency: String,
        coveredAmount: Double,
        uncoveredAmount: Double,
        uncoveredEligibleAmount: Double,
        broadRatio: Double? = nil,
        narrowRatio: Double? = nil
    ) {
        self.currency = currency
        self.coveredAmount = coveredAmount
        self.uncoveredAmount = uncoveredAmount
        self.uncoveredEligibleAmount = uncoveredEligibleAmount
        self.broadRatio = broadRatio
        self.narrowRatio = narrowRatio
    }
}
