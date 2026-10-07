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

public struct SavingsEventInput: Codable, Hashable, Sendable {
    public var title: String
    public var note: String?
    public var occurredOn: String
    public var endedOn: String?
    public var projectedMonthlyAmount: Double
    public var currency: String
    /// Link a resource: the realized figure is then measured from its billing.
    public var resourceId: String?
    public var accountId: String?
    public var costCentreId: String?
    public var horizonMonths: Int?

    public init(
        title: String,
        note: String? = nil,
        occurredOn: String,
        endedOn: String? = nil,
        projectedMonthlyAmount: Double,
        currency: String,
        resourceId: String? = nil,
        accountId: String? = nil,
        costCentreId: String? = nil,
        horizonMonths: Int? = nil
    ) {
        self.title = title
        self.note = note
        self.occurredOn = occurredOn
        self.endedOn = endedOn
        self.projectedMonthlyAmount = projectedMonthlyAmount
        self.currency = currency
        self.resourceId = resourceId
        self.accountId = accountId
        self.costCentreId = costCentreId
        self.horizonMonths = horizonMonths
    }
}
