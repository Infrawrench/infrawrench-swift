/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SavingsEvent: Codable, Hashable, Sendable {
    /// A UUID for stored events; `commitment:<accountId>:<currency>` for derived
    /// rows.
    public var id: String
    public var kind: SavingsEventKind
    public var source: SavingsEventSource
    public var title: String
    public var note: String?
    /// The day the action took effect (UTC).
    public var occurredOn: String
    /// Last day in force, inclusive; null while it still is.
    public var endedOn: String?
    public var accountId: String?
    public var accountName: String?
    public var pluginId: String?
    public var resourceTypeId: String?
    /// Kept after the resource is deleted.
    public var resourceId: String?
    public var resourceName: String?
    /// Explicit attribution; null means attributed by the allocation rules.
    public var costCentreId: String?
    /// What the action was projected to save per month.
    public var projectedMonthlyAmount: Double?
    public var currency: String?
    /// Per-entry horizon override; null uses the org setting.
    public var horizonMonths: Int?
    /// The cost annotation marking the action on charts.
    public var costAnnotationId: String?
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        kind: SavingsEventKind,
        source: SavingsEventSource,
        title: String,
        note: String? = nil,
        occurredOn: String,
        endedOn: String? = nil,
        accountId: String? = nil,
        accountName: String? = nil,
        pluginId: String? = nil,
        resourceTypeId: String? = nil,
        resourceId: String? = nil,
        resourceName: String? = nil,
        costCentreId: String? = nil,
        projectedMonthlyAmount: Double? = nil,
        currency: String? = nil,
        horizonMonths: Int? = nil,
        costAnnotationId: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.kind = kind
        self.source = source
        self.title = title
        self.note = note
        self.occurredOn = occurredOn
        self.endedOn = endedOn
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.resourceId = resourceId
        self.resourceName = resourceName
        self.costCentreId = costCentreId
        self.projectedMonthlyAmount = projectedMonthlyAmount
        self.currency = currency
        self.horizonMonths = horizonMonths
        self.costAnnotationId = costAnnotationId
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
