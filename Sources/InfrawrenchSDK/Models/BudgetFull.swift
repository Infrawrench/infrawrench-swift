/*
 * InfrawrenchSDK v1.106.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.106.0).
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
    public var savedFilterId: String?
    public var scenarioModelId: String?
    public var thresholds: [BudgetThreshold]
    /// Which number the budget tracks. Defaults to `cash`: what the provider
    /// charged, when it charged it. An organization holding reservations or
    /// savings plans usually wants `amortized`: a cash budget is blown the month
    /// a commitment is bought and then reads as under-spent for the rest of the
    /// term it paid for. `blended` additionally spreads each commitment's
    /// discount evenly over all the usage it could cover, which is the fair basis
    /// for a team's budget when commitments are bought centrally.
    public var costBasis: BudgetCostBasis
    /// Measure this budget against billing-rule-adjusted spend (the internal
    /// figure) instead of what the providers charged. False by default, and for
    /// every budget nobody opted in. The default is a deliberate refusal: a
    /// markup is organisation policy and a budget threshold pages a real person,
    /// so adding one settings row must not be able to move every on-call rota at
    /// once. Unlike a scenario this affects `actual` thresholds too; an opted-in
    /// budget is measuring the internal number, and month-to-date internal spend
    /// is as marked up as the forecast is. The alert body says the figure is
    /// adjusted and names the collected one. Updates are full replaces, so
    /// omitting it on PUT clears the opt-in.
    public var useAdjustedSpend: Bool
    public var emailRecipients: AlertEmailRecipients
    public var createdByUserId: String?
    public var deletedAt: String?
    public var createdAt: String
    public var updatedAt: String
    public var measure: BudgetMeasure
    public var usageUnit: String?
    public var usageAmount: Double?
    public var period: BudgetPeriod?
    public var parentBudgetId: String?

    public init(
        id: String,
        organizationId: String,
        name: String,
        amountCents: Int,
        currency: String,
        filters: [BudgetCostFilter],
        savedFilterId: String? = nil,
        scenarioModelId: String? = nil,
        thresholds: [BudgetThreshold],
        costBasis: BudgetCostBasis,
        useAdjustedSpend: Bool,
        emailRecipients: AlertEmailRecipients,
        createdByUserId: String? = nil,
        deletedAt: String? = nil,
        createdAt: String,
        updatedAt: String,
        measure: BudgetMeasure,
        usageUnit: String? = nil,
        usageAmount: Double? = nil,
        period: BudgetPeriod? = nil,
        parentBudgetId: String? = nil
    ) {
        self.id = id
        self.organizationId = organizationId
        self.name = name
        self.amountCents = amountCents
        self.currency = currency
        self.filters = filters
        self.savedFilterId = savedFilterId
        self.scenarioModelId = scenarioModelId
        self.thresholds = thresholds
        self.costBasis = costBasis
        self.useAdjustedSpend = useAdjustedSpend
        self.emailRecipients = emailRecipients
        self.createdByUserId = createdByUserId
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.measure = measure
        self.usageUnit = usageUnit
        self.usageAmount = usageAmount
        self.period = period
        self.parentBudgetId = parentBudgetId
    }
}
