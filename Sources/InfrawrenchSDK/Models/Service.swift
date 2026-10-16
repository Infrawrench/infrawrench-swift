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

public struct Service: Codable, Hashable, Sendable {
    public struct Owner: Codable, Hashable, Sendable {
        public var userId: String
        public var name: String?
        public var email: String?

        public init(
            userId: String,
            name: String? = nil,
            email: String? = nil
        ) {
            self.userId = userId
            self.name = name
            self.email = email
        }
    }

    public var id: String
    /// Unique in the organization; at most 120 characters.
    public var name: String
    /// Lower-case letters, digits and dashes; unique. Derived from the name when
    /// omitted.
    public var slug: String
    /// At most 1000 characters.
    public var description: String?
    /// Criticality, 1 being the most critical.
    public var tier: Double?
    /// Free-text owning team; display-only, never routed. At most 120 characters.
    public var ownerTeam: String?
    /// Owning org members (at most 20).
    public var ownerUserIds: [String]
    /// Dashboards, repositories, docs (at most 20).
    public var links: [ServiceLink]
    public var onCallScheduleId: String?
    /// Linked SLOs (at most 50).
    public var sloIds: [String]
    /// Linked runbooks (at most 50).
    public var runbookIds: [String]
    /// Membership rules (at most 20).
    public var rules: [ServiceMembershipRule]
    /// Monthly budget in `budgetCurrency`; read by the cost scorecard check.
    public var monthlyBudget: Double?
    /// ISO 4217 code; required with a budget.
    public var budgetCurrency: String?
    public var owners: [Owner]
    public var onCallScheduleName: String?
    /// Resolved members: explicit plus rule-matched.
    public var memberCount: Int
    /// Current standing on each enabled scorecard.
    public var scores: [ServiceScoreBadge]
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        slug: String,
        description: String? = nil,
        tier: Double? = nil,
        ownerTeam: String? = nil,
        ownerUserIds: [String],
        links: [ServiceLink],
        onCallScheduleId: String? = nil,
        sloIds: [String],
        runbookIds: [String],
        rules: [ServiceMembershipRule],
        monthlyBudget: Double? = nil,
        budgetCurrency: String? = nil,
        owners: [Owner],
        onCallScheduleName: String? = nil,
        memberCount: Int,
        scores: [ServiceScoreBadge],
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
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
        self.owners = owners
        self.onCallScheduleName = onCallScheduleName
        self.memberCount = memberCount
        self.scores = scores
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
