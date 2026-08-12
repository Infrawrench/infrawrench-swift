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

public struct CommitmentsFeed: Codable, Hashable, Sendable {
    public var holdings: [CommitmentHolding]
    public var coverage: CommitmentCoverage
    public var planner: CommitmentPlanner
    public var failures: [CommitmentPollFailure]
    /// Commitment-capable accounts never yet collected — named rather than
    /// omitted.
    public var pendingAccountIds: [String]
    public var utilizationWindowDays: Int
    public var plannerWindowDays: Int

    public init(
        holdings: [CommitmentHolding],
        coverage: CommitmentCoverage,
        planner: CommitmentPlanner,
        failures: [CommitmentPollFailure],
        pendingAccountIds: [String],
        utilizationWindowDays: Int,
        plannerWindowDays: Int
    ) {
        self.holdings = holdings
        self.coverage = coverage
        self.planner = planner
        self.failures = failures
        self.pendingAccountIds = pendingAccountIds
        self.utilizationWindowDays = utilizationWindowDays
        self.plannerWindowDays = plannerWindowDays
    }
}
