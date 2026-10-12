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

public struct ScorecardUpdate: Codable, Hashable, Sendable {
    /// Unique in the organization; at most 120 characters.
    public var name: String?
    /// At most 1000 characters.
    public var description: String?
    /// 1 to 30 checks.
    public var checks: [ScorecardCheck]?
    /// 1 to 6 levels; stored lowest first.
    public var levels: [ScorecardLevel]?
    /// Tiers it applies to; empty means every service.
    public var applicableTiers: [Double]?
    /// Route a `scorecardAlerts` alert when a service drops a level.
    public var alertOnLevelDrop: Bool?
    public var enabled: Bool?

    public init(
        name: String? = nil,
        description: String? = nil,
        checks: [ScorecardCheck]? = nil,
        levels: [ScorecardLevel]? = nil,
        applicableTiers: [Double]? = nil,
        alertOnLevelDrop: Bool? = nil,
        enabled: Bool? = nil
    ) {
        self.name = name
        self.description = description
        self.checks = checks
        self.levels = levels
        self.applicableTiers = applicableTiers
        self.alertOnLevelDrop = alertOnLevelDrop
        self.enabled = enabled
    }
}
