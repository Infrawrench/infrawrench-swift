/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgScorecard: Codable, Hashable, Sendable {
    /// Weighted mean over the assessed pillars, or null when none could be
    /// assessed: an organization with nothing connected has nothing to grade.
    public var score: Int?
    public var grade: OrgScorecardGrade?
    public var pillars: [OrgScorecardPillar]
    /// Pillars whose computation failed, as opposed to having no data. Excluded
    /// from the overall exactly as unassessed ones are, but named apart.
    public var failedPillars: [OrgScorecardPillarId]
    /// Stored daily readings for the last 90 days, oldest first.
    public var trend: [OrgScorecardTrendPoint]
    public var generatedAt: String

    public init(
        score: Int? = nil,
        grade: OrgScorecardGrade? = nil,
        pillars: [OrgScorecardPillar],
        failedPillars: [OrgScorecardPillarId],
        trend: [OrgScorecardTrendPoint],
        generatedAt: String
    ) {
        self.score = score
        self.grade = grade
        self.pillars = pillars
        self.failedPillars = failedPillars
        self.trend = trend
        self.generatedAt = generatedAt
    }
}
