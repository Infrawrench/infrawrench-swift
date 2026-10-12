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

public struct ScorecardResult: Codable, Hashable, Sendable {
    public var scorecardId: String
    public var scorecardName: String
    public var serviceId: String
    /// 0-100; null when no check applied.
    public var score: Double?
    public var level: String?
    public var levelName: String?
    public var checks: [ScorecardCheckResult]
    public var evaluatedAt: String

    public init(
        scorecardId: String,
        scorecardName: String,
        serviceId: String,
        score: Double? = nil,
        level: String? = nil,
        levelName: String? = nil,
        checks: [ScorecardCheckResult],
        evaluatedAt: String
    ) {
        self.scorecardId = scorecardId
        self.scorecardName = scorecardName
        self.serviceId = serviceId
        self.score = score
        self.level = level
        self.levelName = levelName
        self.checks = checks
        self.evaluatedAt = evaluatedAt
    }
}
