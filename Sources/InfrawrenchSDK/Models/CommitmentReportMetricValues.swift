/*
 * InfrawrenchSDK v1.122.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.122.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentReportMetricValues: Codable, Hashable, Sendable {
    /// covered ÷ (coveredAll + uncovered), or the bucket's usage under a
    /// commitment grouping. Null when the denominator is zero, never 0.
    public var coverage: Double?
    /// covered ÷ (coveredAll + uncoveredEligible): the upper bound of coverage.
    /// Null when the denominator is zero, never 0.
    public var eligibleCoverage: Double?
    /// covered ÷ (covered + unused). Null when the denominator is zero, never 0.
    public var utilization: Double?
    /// netSavings ÷ (onDemandEquivalent + uncovered). Null also when netSavings
    /// is null. Null when the denominator is zero, never 0.
    public var effectiveSavingsRate: Double?
    /// (coveredOnDemand − coveredMeasured) − unused. Null when there was covered
    /// usage and none of it had a reported on-demand equivalent; covered usage
    /// without one counts as saving nothing.
    public var netSavings: Double?
    /// uncovered.
    public var onDemandRemainder: Double
    /// covered + unused.
    public var commitmentCost: Double
    /// covered.
    public var usedCommitmentCost: Double
    /// unused.
    public var unusedCommitmentCost: Double
    /// coveredOnDemand + (covered − coveredMeasured).
    public var onDemandEquivalent: Double
    /// coveredMeasured ÷ covered: how much of the covered spend the savings
    /// figure measured. Null without covered spend.
    public var savingsMeasuredShare: Double?

    public init(
        coverage: Double? = nil,
        eligibleCoverage: Double? = nil,
        utilization: Double? = nil,
        effectiveSavingsRate: Double? = nil,
        netSavings: Double? = nil,
        onDemandRemainder: Double,
        commitmentCost: Double,
        usedCommitmentCost: Double,
        unusedCommitmentCost: Double,
        onDemandEquivalent: Double,
        savingsMeasuredShare: Double? = nil
    ) {
        self.coverage = coverage
        self.eligibleCoverage = eligibleCoverage
        self.utilization = utilization
        self.effectiveSavingsRate = effectiveSavingsRate
        self.netSavings = netSavings
        self.onDemandRemainder = onDemandRemainder
        self.commitmentCost = commitmentCost
        self.usedCommitmentCost = usedCommitmentCost
        self.unusedCommitmentCost = unusedCommitmentCost
        self.onDemandEquivalent = onDemandEquivalent
        self.savingsMeasuredShare = savingsMeasuredShare
    }
}
