/*
 * InfrawrenchSDK v1.117.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.117.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentReportTotals: Codable, Hashable, Sendable {
    /// Amortized usage the selected commitments covered: the used commitment
    /// cost.
    public var covered: Double
    /// Amortized usage any commitment covered.
    public var coveredAll: Double
    /// Amortized commitment fees no usage absorbed (only fee rows with a reported
    /// amortized amount).
    public var unused: Double
    /// Amortized usage no commitment covered: the on-demand remainder.
    public var uncovered: Double
    /// Uncovered usage in (provider, service, region) cells with any covered
    /// usage in the window.
    public var uncoveredEligible: Double
    /// On-demand equivalent of covered usage, summed over rows whose provider
    /// reported one.
    public var coveredOnDemand: Double
    /// Amortized amount of those same rows.
    public var coveredMeasured: Double

    public init(
        covered: Double,
        coveredAll: Double,
        unused: Double,
        uncovered: Double,
        uncoveredEligible: Double,
        coveredOnDemand: Double,
        coveredMeasured: Double
    ) {
        self.covered = covered
        self.coveredAll = coveredAll
        self.unused = unused
        self.uncovered = uncovered
        self.uncoveredEligible = uncoveredEligible
        self.coveredOnDemand = coveredOnDemand
        self.coveredMeasured = coveredMeasured
    }
}
