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

public struct Scorecard: Codable, Hashable, Sendable {
    public var id: String
    /// Unique in the organization; at most 120 characters.
    public var name: String
    /// At most 1000 characters.
    public var description: String?
    /// 1 to 30 checks.
    public var checks: [ScorecardCheck]
    /// 1 to 6 levels; stored lowest first.
    public var levels: [ScorecardLevel]
    /// Tiers it applies to; empty means every service.
    public var applicableTiers: [Double]
    /// Route a `scorecardAlerts` alert when a service drops a level.
    public var alertOnLevelDrop: Bool
    public var enabled: Bool
    /// The scorecard seeded for the organization.
    public var isDefault: Bool
    public var lastEvaluatedAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        description: String? = nil,
        checks: [ScorecardCheck],
        levels: [ScorecardLevel],
        applicableTiers: [Double],
        alertOnLevelDrop: Bool,
        enabled: Bool,
        isDefault: Bool,
        lastEvaluatedAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.checks = checks
        self.levels = levels
        self.applicableTiers = applicableTiers
        self.alertOnLevelDrop = alertOnLevelDrop
        self.enabled = enabled
        self.isDefault = isDefault
        self.lastEvaluatedAt = lastEvaluatedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
