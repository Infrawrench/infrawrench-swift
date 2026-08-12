/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetInput: Codable, Hashable, Sendable {
    public var name: String
    public var amountCents: Int
    public var currency: String?
    public var filters: [BudgetCostFilter]?
    /// A saved cost filter (see /saved-cost-filters) applied by reference and
    /// AND-composed with `filters` when the budget is evaluated. Updates are full
    /// replaces, so omitting it on PUT clears it. A reference that fails to
    /// resolve errors the budget's evaluation rather than silently measuring all
    /// spend.
    public var savedFilterId: String?
    /// A scenario model (see /cost-scenarios) this budget's **forecast**
    /// thresholds are measured against. Null — the default, and the value for
    /// every budget nobody deliberately opts in — keeps them on the bare trend.
    /// Opting in is per-budget on purpose: a hypothesis somebody typed into a
    /// form must not silently change when real people get paged. `actual`
    /// thresholds are never affected; they measure money already spent. Updates
    /// are full replaces, so omitting it on PUT clears the opt-in.
    public var scenarioModelId: String?
    public var thresholds: [BudgetThreshold]
    public var costBasis: BudgetCostBasis?
    /// Measure this budget against billing-rule-adjusted spend — the internal
    /// figure — instead of what the providers charged. False by default, and for
    /// every budget nobody opted in. The default is a deliberate refusal: a
    /// markup is organisation policy and a budget threshold pages a real person,
    /// so adding one settings row must not be able to move every on-call rota at
    /// once. Unlike a scenario this affects `actual` thresholds too — an opted-in
    /// budget is measuring the internal number, and month-to-date internal spend
    /// is as marked up as the forecast is. The alert body says the figure is
    /// adjusted and names the collected one. Updates are full replaces, so
    /// omitting it on PUT clears the opt-in.
    public var useAdjustedSpend: Bool?

    public init(
        name: String,
        amountCents: Int,
        currency: String? = nil,
        filters: [BudgetCostFilter]? = nil,
        savedFilterId: String? = nil,
        scenarioModelId: String? = nil,
        thresholds: [BudgetThreshold],
        costBasis: BudgetCostBasis? = nil,
        useAdjustedSpend: Bool? = nil
    ) {
        self.name = name
        self.amountCents = amountCents
        self.currency = currency
        self.filters = filters
        self.savedFilterId = savedFilterId
        self.scenarioModelId = scenarioModelId
        self.thresholds = thresholds
        self.costBasis = costBasis
        self.useAdjustedSpend = useAdjustedSpend
    }
}
