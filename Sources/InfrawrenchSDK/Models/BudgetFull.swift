/*
 * InfrawrenchSDK v1.6.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.6.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetFull: Codable, Hashable, Sendable {
    public var id: String
    public var organizationId: String
    public var name: String
    public var amountCents: Int
    public var currency: String
    public var filters: [BudgetCostFilter]
    /// A saved cost filter (see /saved-cost-filters) applied by reference and
    /// AND-composed with `filters` when the budget is evaluated. Updates are full
    /// replaces, so omitting it on PUT clears it. A reference that fails to
    /// resolve errors the budget's evaluation rather than silently measuring all
    /// spend.
    public var savedFilterId: String?
    public var thresholds: [BudgetThreshold]
    public var costBasis: BudgetCostBasis
    public var createdByUserId: String?
    public var deletedAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        organizationId: String,
        name: String,
        amountCents: Int,
        currency: String,
        filters: [BudgetCostFilter],
        savedFilterId: String? = nil,
        thresholds: [BudgetThreshold],
        costBasis: BudgetCostBasis,
        createdByUserId: String? = nil,
        deletedAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.organizationId = organizationId
        self.name = name
        self.amountCents = amountCents
        self.currency = currency
        self.filters = filters
        self.savedFilterId = savedFilterId
        self.thresholds = thresholds
        self.costBasis = costBasis
        self.createdByUserId = createdByUserId
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
