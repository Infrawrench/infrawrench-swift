/*
 * InfrawrenchSDK v0.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PushedCostRow: Codable, Hashable, Sendable {
    /// UTC day the spend belongs to.
    public var date: String
    public var currency: String
    /// Money for this day/dimension combination. Negative for credits.
    public var amount: Double
    /// Becomes a group/filter value.
    public var service: String?
    public var region: String?
    /// Opaque id of the thing being billed; groups the `resource` dimension.
    public var resourceId: String?
    /// Cost-allocation tags, at most 32. Keys starting with `infrawrench:` are
    /// reserved and rejected.
    public var tags: [String: String]?
    public var usageAmount: Double?
    public var usageUnit: String?
    /// Attribute this row to a connected account. Must belong to the calling
    /// organization. Omit to attribute it to the source itself.
    public var accountId: String?

    public init(
        date: String,
        currency: String,
        amount: Double,
        service: String? = nil,
        region: String? = nil,
        resourceId: String? = nil,
        tags: [String: String]? = nil,
        usageAmount: Double? = nil,
        usageUnit: String? = nil,
        accountId: String? = nil
    ) {
        self.date = date
        self.currency = currency
        self.amount = amount
        self.service = service
        self.region = region
        self.resourceId = resourceId
        self.tags = tags
        self.usageAmount = usageAmount
        self.usageUnit = usageUnit
        self.accountId = accountId
    }
}
