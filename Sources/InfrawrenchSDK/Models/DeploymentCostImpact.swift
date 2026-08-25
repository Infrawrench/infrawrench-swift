/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeploymentCostImpact: Codable, Hashable, Sendable {
    public struct Total: Codable, Hashable, Sendable {
        public var currency: String
        public var deltaPerDay: Double

        public init(
            currency: String,
            deltaPerDay: Double
        ) {
            self.currency = currency
            self.deltaPerDay = deltaPerDay
        }
    }

    public var runId: String
    public var costBasis: ChangeCostBasis
    public var windowDays: Int
    /// The run's start day, UTC — what both windows hang off.
    public var eventDay: String
    /// One row per resource the run provisioned through
    /// `infra.accounts.*.create(...)`. That is the only set attributable to a run
    /// with certainty: a deploy that merely re-shipped an image links to nothing
    /// and honestly reports an empty breakdown.
    public var resources: [DeploymentCostImpactResource]
    /// Summed `deltaPerDay` per currency across the **measured** rows only, so
    /// the breakdown always adds up to it. An unmeasurable resource contributes
    /// nothing rather than zero.
    public var total: [Total]
    /// Rows excluded from `total` because their impact could not be measured.
    public var unknownResources: Int
    public var confidence: ChangeCostImpactConfidence

    public init(
        runId: String,
        costBasis: ChangeCostBasis,
        windowDays: Int,
        eventDay: String,
        resources: [DeploymentCostImpactResource],
        total: [Total],
        unknownResources: Int,
        confidence: ChangeCostImpactConfidence
    ) {
        self.runId = runId
        self.costBasis = costBasis
        self.windowDays = windowDays
        self.eventDay = eventDay
        self.resources = resources
        self.total = total
        self.unknownResources = unknownResources
        self.confidence = confidence
    }
}
