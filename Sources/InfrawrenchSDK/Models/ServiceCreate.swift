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

public struct ServiceCreate: Codable, Hashable, Sendable {
    /// Unique in the organization; at most 120 characters.
    public var name: String
    /// Lower-case letters, digits and dashes; unique. Derived from the name when
    /// omitted.
    public var slug: String?
    /// At most 1000 characters.
    public var description: String?
    /// Criticality, 1 being the most critical.
    public var tier: Double?
    /// Free-text owning team; display-only, never routed. At most 120 characters.
    public var ownerTeam: String?
    /// Owning org members (at most 20).
    public var ownerUserIds: [String]?
    /// Dashboards, repositories, docs (at most 20).
    public var links: [ServiceLink]?
    public var onCallScheduleId: String?
    /// Linked SLOs (at most 50).
    public var sloIds: [String]?
    /// Linked runbooks (at most 50).
    public var runbookIds: [String]?
    /// Membership rules (at most 20).
    public var rules: [ServiceMembershipRule]?
    /// Monthly budget in `budgetCurrency`; read by the cost scorecard check.
    public var monthlyBudget: Double?
    /// ISO 4217 code; required with a budget.
    public var budgetCurrency: String?

    public init(
        name: String,
        slug: String? = nil,
        description: String? = nil,
        tier: Double? = nil,
        ownerTeam: String? = nil,
        ownerUserIds: [String]? = nil,
        links: [ServiceLink]? = nil,
        onCallScheduleId: String? = nil,
        sloIds: [String]? = nil,
        runbookIds: [String]? = nil,
        rules: [ServiceMembershipRule]? = nil,
        monthlyBudget: Double? = nil,
        budgetCurrency: String? = nil
    ) {
        self.name = name
        self.slug = slug
        self.description = description
        self.tier = tier
        self.ownerTeam = ownerTeam
        self.ownerUserIds = ownerUserIds
        self.links = links
        self.onCallScheduleId = onCallScheduleId
        self.sloIds = sloIds
        self.runbookIds = runbookIds
        self.rules = rules
        self.monthlyBudget = monthlyBudget
        self.budgetCurrency = budgetCurrency
    }
}
