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

public struct OrgScorecardTrendPoint: Codable, Hashable, Sendable {
    /// UTC calendar day.
    public var day: String
    public var score: Int
    public var grade: OrgScorecardGrade?
    /// Per-pillar scores that day. A pillar unassessed then is absent, not zero.
    public var pillars: [String: Int]

    public init(
        day: String,
        score: Int,
        grade: OrgScorecardGrade? = nil,
        pillars: [String: Int]
    ) {
        self.day = day
        self.score = score
        self.grade = grade
        self.pillars = pillars
    }
}
