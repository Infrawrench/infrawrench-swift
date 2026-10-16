/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgScorecardPillar: Codable, Hashable, Sendable {
    public var id: OrgScorecardPillarId
    /// Null when the pillar could not be assessed, **never zero**. An unassessed
    /// pillar is excluded from the overall rather than counted as failure.
    public var score: Int?
    /// Relative weight in the overall, fixed: posture 25, recoverability 20,
    /// services 15, deadlines 15, access 10, headroom 10, ownership 5. Weights
    /// renormalize over the assessed pillars, so gaining one cannot read as a
    /// regression.
    public var weight: Int
    /// What the score measures over, in one line.
    public var headline: String
    /// Why there is no score, phrased so a reader can act on it. Null when
    /// scored.
    public var unassessedReason: String?
    /// The single most valuable thing to fix. Null when clean or unassessed.
    public var nextStep: String?
    public var facts: [OrgScorecardFact]

    public init(
        id: OrgScorecardPillarId,
        score: Int? = nil,
        weight: Int,
        headline: String,
        unassessedReason: String? = nil,
        nextStep: String? = nil,
        facts: [OrgScorecardFact]
    ) {
        self.id = id
        self.score = score
        self.weight = weight
        self.headline = headline
        self.unassessedReason = unassessedReason
        self.nextStep = nextStep
        self.facts = facts
    }
}
