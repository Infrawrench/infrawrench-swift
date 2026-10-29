/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ServiceScoreBadge: Codable, Hashable, Sendable {
    public var scorecardId: String
    public var scorecardName: String
    public var score: Double?
    public var level: String?
    public var levelName: String?

    public init(
        scorecardId: String,
        scorecardName: String,
        score: Double? = nil,
        level: String? = nil,
        levelName: String? = nil
    ) {
        self.scorecardId = scorecardId
        self.scorecardName = scorecardName
        self.score = score
        self.level = level
        self.levelName = levelName
    }
}
