/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct UnattributedExtendedSupportCharge: Codable, Hashable, Sendable {
    public var resourceTypeId: String?
    public var releaseId: String?
    public var region: String?
    public var engine: String?
    /// Provider line item, e.g. an AWS usage type.
    public var lineItem: String
    /// Billed over the window.
    public var amount: Double
    public var currency: String
    public var accountId: String
    public var accountName: String
    public var monthlyAmount: Double

    public init(
        resourceTypeId: String? = nil,
        releaseId: String? = nil,
        region: String? = nil,
        engine: String? = nil,
        lineItem: String,
        amount: Double,
        currency: String,
        accountId: String,
        accountName: String,
        monthlyAmount: Double
    ) {
        self.resourceTypeId = resourceTypeId
        self.releaseId = releaseId
        self.region = region
        self.engine = engine
        self.lineItem = lineItem
        self.amount = amount
        self.currency = currency
        self.accountId = accountId
        self.accountName = accountName
        self.monthlyAmount = monthlyAmount
    }
}
