/*
 * InfrawrenchSDK v0.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.21.0).
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
    public var thresholds: [BudgetThreshold]
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
        thresholds: [BudgetThreshold],
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
        self.thresholds = thresholds
        self.createdByUserId = createdByUserId
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
